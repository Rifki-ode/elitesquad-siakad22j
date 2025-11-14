import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/dosen_service.dart';
import '../models/dosen.dart';
import 'dashboard_dosen_screen.dart';

class LoginDosenScreen extends StatefulWidget {
  const LoginDosenScreen({super.key});

  @override
  State<LoginDosenScreen> createState() => _LoginDosenScreenState();
}

class _LoginDosenScreenState extends State<LoginDosenScreen> {
  final _namaController = TextEditingController();
  final _nidnController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text("Login Dosen"),
        backgroundColor: Colors.brown[400],
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.school,
                size: 80,
                color: Colors.brown,
              ),
              const SizedBox(height: 20),
              const Text(
                "Silakan login sebagai Dosen 👨‍🏫",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              const SizedBox(height: 30),

              // 🔹 Input Nama
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: "Nama Dosen",
                  prefixIcon: const Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Nama dosen tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // 🔹 Input NIDN
              TextFormField(
                controller: _nidnController,
                decoration: InputDecoration(
                  labelText: "NIDN",
                  prefixIcon: const Icon(Icons.badge),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "NIDN tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),

              // 🔹 Tombol Login
              ElevatedButton.icon(
                icon: const Icon(Icons.login),
                label: const Text(
                  "Login",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[400],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  elevation: 2,
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final dosenService =
                        Provider.of<DosenService>(context, listen: false);
                    final namaInput = _namaController.text.trim();
                    final nidnInput = _nidnController.text.trim();

                    final Dosen? dosen =
                        dosenService.cariDosen(namaInput, nidnInput);

                    if (dosen != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DashboardDosenScreen(dosen: dosen),
                        ),
                      );
                    } else {
                      setState(() {
                        error = "Nama atau NIDN salah!";
                      });
                    }
                  }
                },
              ),

              // 🔹 Pesan Error (jika login gagal)
              if (error != null)
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    error!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

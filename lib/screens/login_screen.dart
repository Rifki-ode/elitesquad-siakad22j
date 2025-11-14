import 'package:flutter/material.dart';
import 'package:siakad22j/screens/dashboard_mahasiswa_screen.dart';
import '../data/dummy_data.dart';
import '../models/mahasiswa.dart';
import 'dashboard_screen.dart';
import 'login_dosen_screen.dart'; // 🔹 Tambahkan import ke halaman login dosen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();

  void _login() {
    final nama = _namaController.text.trim();
    final nim = _nimController.text.trim();

    if (nama.isEmpty || nim.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama dan NIM harus diisi')),
      );
      return;
    }

    // Cek data mahasiswa di dummy_data.dart
    final data = daftarMahasiswa.firstWhere(
      (m) => m.nama.toLowerCase() == nama.toLowerCase() && m.nim == nim,
      orElse: () => Mahasiswa(nama: '', nim: '', prodi: '', semester: 0),
    );

    if (data.nim.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
         builder: (_) => DashboardMahasiswaScreen(nim: data.nim),

        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama atau NIM tidak valid!')),
      );
    }
  }

  void _goToLoginDosen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LoginDosenScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Mahasiswa'),
        centerTitle: true,
        backgroundColor: Colors.brown[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Icon(Icons.school, size: 90, color: Colors.brown),
                const SizedBox(height: 20),
                const Text(
                  'SIAKAD22J',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _namaController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Mahasiswa',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _nimController,
                  decoration: const InputDecoration(
                    labelText: 'NIM Mahasiswa',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _login,
                    icon: const Icon(Icons.login),
                    label: const Text('Masuk'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown[400],
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: _goToLoginDosen,
                  child: const Text(
                    'Login sebagai Dosen?',
                    style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

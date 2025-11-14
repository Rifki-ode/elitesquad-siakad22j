// 📄 lib/screens/nilai_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/dummy_data.dart';
import '../models/mahasiswa.dart';
import '../services/nilai_service.dart';

class NilaiScreen extends StatelessWidget {
  final Mahasiswa mahasiswa;
  const NilaiScreen({super.key, required this.mahasiswa});

  @override
  Widget build(BuildContext context) {
    final nilaiService = Provider.of<NilaiService>(context);
    final nilaiMahasiswa = nilaiService.semuaNilai[mahasiswa.nim] ?? {};

    return Scaffold(
      appBar: AppBar(
        title: Text('Nilai - ${mahasiswa.nama}'),
        backgroundColor: Colors.brown[300],
        centerTitle: true,
      ),
      body: nilaiMahasiswa.isEmpty
          ? const Center(
              child: Text(
                'Belum ada nilai yang tersimpan.',
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: nilaiMahasiswa.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, i) {
                final kodeMK = nilaiMahasiswa.keys.elementAt(i);
                final nilai = nilaiMahasiswa[kodeMK]!;
                final mk = daftarMataKuliah.firstWhere(
                  (m) => m.kode == kodeMK,
                  orElse: () => throw Exception("MK tidak ditemukan"),
                );

                return Card(
                  elevation: 2,
                  color: Colors.brown[50],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.brown[300],
                      child: Text(
                        nilai.huruf,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    title: Text(
                      mk.nama,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    subtitle: Text("Kode: ${mk.kode} | SKS: ${mk.sks}"),
                    trailing: Text(
                      "Angka: ${nilai.angka.toStringAsFixed(0)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

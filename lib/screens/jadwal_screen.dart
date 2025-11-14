// 📄 lib/screens/jadwal_screen.dart
import 'package:flutter/material.dart';
import '../models/mahasiswa.dart';
import '../models/matakuliah.dart';

class JadwalScreen extends StatelessWidget {
  final Mahasiswa mahasiswa;

  const JadwalScreen({Key? key, required this.mahasiswa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MataKuliah> jadwal = mahasiswa.jadwal;

    final Color coklatTua = const Color(0xFF5D4037);
    final Color coklatSusu = const Color(0xFFD7CCC8);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Mata Kuliah'),
        backgroundColor: coklatTua,
      ),
      backgroundColor: coklatSusu,
      body: jadwal.isEmpty
          ? const Center(
              child: Text(
                'Belum ada mata kuliah yang diambil.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: jadwal.length,
              itemBuilder: (context, index) {
                final mk = jadwal[index];
                return Card(
                  color: Colors.white,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    title: Text(
                      mk.nama,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: coklatTua,
                      ),
                    ),
                    subtitle: Text(
                      '${mk.kode} • ${mk.sks} SKS\n'
                      'Dosen: ${mk.dosenPengampu}\n'
                      'Jadwal: ${mk.jadwal.join(", ")}',
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}

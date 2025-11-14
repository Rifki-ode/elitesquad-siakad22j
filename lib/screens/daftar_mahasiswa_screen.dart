// 📄 lib/screens/daftar_mahasiswa_screen.dart
import 'package:flutter/material.dart';
import '../models/matakuliah.dart';
import '../models/dosen.dart';
import '../models/nilai.dart';
import '../data/dummy_data.dart'; // agar bisa akses daftarMahasiswa

class DaftarMahasiswaScreen extends StatefulWidget {
  final MataKuliah matakuliah;
  final Dosen dosen;

  const DaftarMahasiswaScreen({
    super.key,
    required this.matakuliah,
    required this.dosen,
  });

  @override
  State<DaftarMahasiswaScreen> createState() => _DaftarMahasiswaScreenState();
}

class _DaftarMahasiswaScreenState extends State<DaftarMahasiswaScreen> {
  void _beriNilai(BuildContext context, String nim) async {
    final controller = TextEditingController();

    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Input Nilai untuk $nim"),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: "Masukkan nilai angka (0-100)",
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.brown[300]),
            onPressed: () {
              final input = controller.text.trim();
              if (input.isEmpty) return;
              final angka = double.tryParse(input) ?? 0;

              // 🔹 Konversi nilai angka ke huruf
              String huruf;
              if (angka >= 85) {
                huruf = 'A';
              } else if (angka >= 75) {
                huruf = 'B';
              } else if (angka >= 65) {
                huruf = 'C';
              } else if (angka >= 50) {
                huruf = 'D';
              } else {
                huruf = 'E';
              }

              // 🔹 Cari mahasiswa dan update nilaiSemester-nya
              final mahasiswa = daftarMahasiswa.firstWhere(
                (m) => m.nim == nim,
                orElse: () => throw Exception("Mahasiswa tidak ditemukan"),
              );

              mahasiswa.nilaiSemester[widget.matakuliah.kode] = Nilai(
                nim: mahasiswa.nim,
                kodeMK: widget.matakuliah.kode,
                namaMK: widget.matakuliah.nama,
                angka: angka,
                huruf: huruf,
              );

              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      "✅ Nilai $huruf (${angka.toStringAsFixed(0)}) tersimpan untuk ${mahasiswa.nama}."),
                  backgroundColor: Colors.green,
                ),
              );
              setState(() {}); // refresh daftar
            },
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final daftar = daftarMahasiswa
        .where((m) => m.jadwal.any(
              (mk) => mk.kode == widget.matakuliah.kode,
            ))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Mahasiswa - ${widget.matakuliah.nama}"),
        backgroundColor: Colors.brown[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: daftar.isEmpty
            ? const Center(
                child: Text(
                  "Belum ada mahasiswa yang mengambil mata kuliah ini.",
                  style: TextStyle(fontSize: 16),
                ),
              )
            : ListView.builder(
                itemCount: daftar.length,
                itemBuilder: (ctx, i) {
                  final mhs = daftar[i];
                  final nilai = mhs.nilaiSemester[widget.matakuliah.kode];

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.person,
                          color: Colors.brown, size: 32),
                      title: Text(
                        "${mhs.nama} (${mhs.nim})",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        nilai != null
                            ? "Nilai: ${nilai.huruf} (${nilai.angka.toStringAsFixed(0)})"
                            : "Belum dinilai",
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit_note, color: Colors.orange),
                        onPressed: () => _beriNilai(context, mhs.nim),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

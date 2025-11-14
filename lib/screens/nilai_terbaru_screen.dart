import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/mahasiswa.dart';
import '../services/nilai_service.dart';

class NilaiTerbaruScreen extends StatelessWidget {
  final Mahasiswa mahasiswa;
  const NilaiTerbaruScreen({super.key, required this.mahasiswa});

  @override
  Widget build(BuildContext context) {
    return Consumer<NilaiService>(
      builder: (context, nilaiService, _) {
        final nilaiMap = nilaiService.semuaNilai[mahasiswa.nim] ?? mahasiswa.nilaiSemester;

        return Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: const Text("Nilai Semester Terbaru"),
            backgroundColor: Colors.brown[400],
          ),
          body: nilaiMap.isEmpty
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text(
                      "Belum ada nilai yang diinput oleh dosen.",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: nilaiMap.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, i) {
                    final kodeMK = nilaiMap.keys.elementAt(i);
                    final nilai = nilaiMap[kodeMK]!;

                    return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      color: Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.brown[400],
                          radius: 25,
                          child: Text(
                            nilai.huruf,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        title: Text(
                          nilai.namaMK,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text("Kode: ${nilai.kodeMK}"),
                        trailing: Text(
                          "Angka: ${nilai.angka.toStringAsFixed(1)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}

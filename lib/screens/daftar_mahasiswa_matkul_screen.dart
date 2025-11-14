import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/dummy_data.dart';
import '../models/matakuliah.dart';
import '../models/mahasiswa.dart';
import '../services/nilai_service.dart';

class DaftarMahasiswaMatkulScreen extends StatelessWidget {
  final MataKuliah mataKuliah;
  const DaftarMahasiswaMatkulScreen({super.key, required this.mataKuliah});

  @override
  Widget build(BuildContext context) {
    final List<Mahasiswa> mahasiswaList = getMahasiswaByMataKuliah(mataKuliah.kode);
    final nilaiService = Provider.of<NilaiService>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Mahasiswa - ${mataKuliah.nama}')),
      body: mahasiswaList.isEmpty
          ? const Center(child: Text('Belum ada mahasiswa yang mengambil mata kuliah ini.'))
          : ListView.builder(
              itemCount: mahasiswaList.length,
              itemBuilder: (context, index) {
                final mhs = mahasiswaList[index];
                final currentNilai = nilaiService.getNilai(mhs.nim, mataKuliah.kode) ?? '';
                final controller = TextEditingController(text: currentNilai);

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    title: Text(mhs.nama),
                    subtitle: Text('${mhs.nim} - ${mhs.prodi} (Smt ${mhs.semester})'),
                    trailing: SizedBox(
                      width: 90,
                      child: TextField(
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: 'Nilai',
                          border: OutlineInputBorder(),
                        ),
                        onSubmitted: (value) {
                          nilaiService.simpanNilai(
                            nim: mhs.nim,
                            kodeMatkul: mataKuliah.kode,
                            nilai: value.toUpperCase(),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Nilai ${mhs.nama} disimpan')),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

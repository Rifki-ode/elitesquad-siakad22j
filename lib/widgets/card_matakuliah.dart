import 'package:flutter/material.dart';
import '../models/matakuliah.dart';

class CardMatakuliah extends StatelessWidget {
  final MataKuliah matakuliah;
  const CardMatakuliah({super.key, required this.matakuliah});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 3,
      child: ListTile(
        title: Text(matakuliah.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${matakuliah.kode} • ${matakuliah.sks} SKS\n'
            'Dosen: ${matakuliah.dosenPengampu}\n'
            'Jadwal: ${matakuliah.jadwal.join(', ')}'),
        isThreeLine: true,
      ),
    );
  }
}

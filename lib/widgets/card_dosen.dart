import 'package:flutter/material.dart';
import '../models/dosen.dart';

class CardDosen extends StatelessWidget {
  final Dosen dosen;
  const CardDosen({super.key, required this.dosen});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.brown[300],
          child: Text(
            dosen.nama.substring(0, 1).toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          dosen.nama,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          '${dosen.nidn}\nMata Kuliah: ${dosen.mataKuliah}',
          style: const TextStyle(height: 1.4),
        ),
        isThreeLine: true,
      ),
    );
  }
}

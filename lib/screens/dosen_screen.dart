import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/card_dosen.dart';

class DosenScreen extends StatelessWidget {
  const DosenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Dosen')),
      body: ListView.builder(
        itemCount: daftarDosen.length,
        itemBuilder: (ctx, i) => CardDosen(dosen: daftarDosen[i]),
      ),
    );
  }
}

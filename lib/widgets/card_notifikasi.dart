import 'package:flutter/material.dart';

class CardNotifikasi extends StatelessWidget {
  final String pesan;
  final DateTime waktu;
  const CardNotifikasi({super.key, required this.pesan, required this.waktu});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: const Icon(Icons.notifications),
        title: Text(pesan),
        subtitle: Text(waktu.toString()),
      ),
    );
  }
}

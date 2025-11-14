import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/notifikasi_service.dart'; 

class NotifikasiScreen extends StatelessWidget {
  const NotifikasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifikasiService = Provider.of<NotifikasiService>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Notifikasi')),
      body: notifikasiService.daftar.isEmpty
          ? const Center(child: Text('Belum ada notifikasi'))
          : ListView.builder(
              itemCount: notifikasiService.daftar.length,
              itemBuilder: (context, index) {
                final notif = notifikasiService.daftar[index];
                return ListTile(
                  leading: const Icon(Icons.notifications),
                  title: Text(notif.pesan),
                  subtitle: Text(
                    notif.waktu.toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => notifikasiService.bersihkan(),
        child: const Icon(Icons.delete),
      ),
    );
  }
}

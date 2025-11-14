import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/mahasiswa.dart';
import '../services/penawaran_service.dart';
import 'penawaran_screen.dart';
import 'nilai_screen.dart';
import 'dosen_screen.dart';
import 'organisasi_screen.dart';
import 'notifikasi_screen.dart';
import 'jadwal_screen.dart';
import 'login_screen.dart';

class DashboardScreen extends StatelessWidget {
  final Mahasiswa mahasiswa;
  const DashboardScreen({super.key, required this.mahasiswa});

  @override
  Widget build(BuildContext context) {
    final penawaranService =
        Provider.of<PenawaranService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('SIAKAD - ${mahasiswa.nama}'),
        backgroundColor: Colors.brown[300],
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: 'Keluar',
            onPressed: () => _konfirmasiLogout(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _menuCard(context, 'Penawaran MK', Icons.book,
                PenawaranScreen(mahasiswa: mahasiswa)),
            _menuCard(context, 'Nilai Semester', Icons.grade,
                NilaiScreen(mahasiswa: mahasiswa)),
            _menuCard(context, '📅 Jadwal Mata Kuliah', Icons.schedule,
                JadwalScreen(mahasiswa: mahasiswa)),
            _menuCard(context, 'Dosen', Icons.person, const DosenScreen()),
            _menuCard(context, 'Organisasi', Icons.group,
                const OrganisasiScreen()),
            _menuCard(context, 'Notifikasi', Icons.notifications,
                const NotifikasiScreen()),
          ],
        ),
      ),
    );
  }

  Widget _menuCard(BuildContext ctx, String title, IconData icon, Widget nextPage) {
    return GestureDetector(
      onTap: () => Navigator.push(
        ctx,
        MaterialPageRoute(builder: (_) => nextPage),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFD2B48C),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black26)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: const Color(0xFF5C4033)),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF5C4033),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _konfirmasiLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Konfirmasi Logout"),
        content: const Text("Apakah Anda yakin ingin keluar dari akun ini?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Batal"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.brown[300]),
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
            child: const Text("Ya, Keluar"),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/mahasiswa.dart';
import '../data/dummy_data.dart';
import '../services/nilai_service.dart';
import '../services/penawaran_service.dart';
import 'penawaran_screen.dart';
import 'dosen_screen.dart';
import 'jadwal_screen.dart';
import 'login_screen.dart';
import 'nilai_terbaru_screen.dart';

class DashboardMahasiswaScreen extends StatelessWidget {
  final String nim;
  const DashboardMahasiswaScreen({super.key, required this.nim});

  @override
  Widget build(BuildContext context) {
    return Consumer<NilaiService>(
      builder: (context, nilaiService, _) {
        final mhs = daftarMahasiswa.firstWhere(
          (m) => m.nim == nim,
          orElse: () => throw Exception("Mahasiswa tidak ditemukan"),
        );

        return Scaffold(
          backgroundColor: const Color(0xFFF6EFE7),
          appBar: AppBar(
            title: Text("SIAKAD - ${mhs.nama}"),
            backgroundColor: const Color(0xFF8B5E3C),
            elevation: 4,
            actions: [
              IconButton(
                icon: const Icon(Icons.logout, color: Colors.white),
                tooltip: 'Keluar',
                onPressed: () => _konfirmasiLogout(context),
              ),
            ],
          ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFFF9F5), Color(0xFFF6EFE7)],
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ======================================
                  // 🧑‍🎓 IDENTITAS MAHASISWA
                  // ======================================
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: const Color(0xFFD2B48C),
                        child: Text(
                          mhs.nama[0].toUpperCase(),
                          style: const TextStyle(
                            fontSize: 26,
                            color: Color(0xFF5C4033),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mhs.nama,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5C4033),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text("NIM: ${mhs.nim}",
                              style: const TextStyle(fontSize: 14)),
                          Text("Prodi: ${mhs.prodi}",
                              style: const TextStyle(fontSize: 14)),
                          Text("Semester: ${mhs.semester}",
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),
                  const Divider(),

                  // ======================================
                  // 🎯 MENU FITUR MINI
                  // ======================================
                  const Text(
                    "Menu Fitur",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF5C4033),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _menuIcon(context, Icons.book, "Penawaran",
                          PenawaranScreen(mahasiswa: mhs)),
                      _menuIcon(context, Icons.school_outlined, "Nilai",
                          NilaiTerbaruScreen(mahasiswa: mhs)),
                      _menuIcon(context, Icons.schedule, "Jadwal",
                          JadwalScreen(mahasiswa: mhs)),
                      _menuIcon(context, Icons.person, "Dosen",
                          const DosenScreen()),
                    ],
                  ),

                  const SizedBox(height: 30),
                  const Divider(),

                  // ======================================
                  // 📚 JADWAL MATA KULIAH (CONSUMER)
                  // ======================================
                  const Text(
                    "📅 Jadwal Mata Kuliah yang Diambil",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF5C4033),
                    ),
                  ),
                  const SizedBox(height: 15),

                  Consumer<PenawaranService>(
                    builder: (context, penawaranService, _) {
                      final jadwalMahasiswa =
                          penawaranService.getJadwalMahasiswa(nim);

                      if (jadwalMahasiswa.isEmpty) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              "Belum ada jadwal yang diambil.",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: jadwalMahasiswa.length,
                        itemBuilder: (context, index) {
                          final mk = jadwalMahasiswa[index];

                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 3,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    const Color(0xFFD2B48C).withOpacity(0.7),
                                child: const Icon(Icons.menu_book,
                                    color: Color(0xFF5C4033)),
                              ),
                              title: Text(
                                mk['namaMK'] ?? '-',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF5C4033),
                                ),
                              ),
                              subtitle: Text(
                                "${mk['hari']}, ${mk['jamMulai']} - ${mk['jamSelesai']}\n"
                                "Dosen: ${mk['namaDosen']}",
                                style: const TextStyle(fontSize: 13),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // =====================================================
  // 🔸 KOMPONEN MENU ICON
  // =====================================================
  Widget _menuIcon(BuildContext ctx, IconData icon, String label, Widget page) {
    return InkWell(
      onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => page)),
      borderRadius: BorderRadius.circular(50),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFD2B48C).withOpacity(0.4),
            ),
            child: Icon(icon, color: const Color(0xFF5C4033), size: 30),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF5C4033),
            ),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // 🔸 KONFIRMASI LOGOUT
  // =====================================================
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
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.brown[400]),
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

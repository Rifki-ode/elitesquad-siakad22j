import 'package:flutter/material.dart';
import '../models/dosen.dart';
import '../models/nilai.dart';
import '../data/dummy_data.dart'; // untuk getMahasiswaByMataKuliah()

class DashboardDosenScreen extends StatefulWidget {
  final Dosen dosen;

  const DashboardDosenScreen({super.key, required this.dosen});

  @override
  State<DashboardDosenScreen> createState() => _DashboardDosenScreenState();
}

class _DashboardDosenScreenState extends State<DashboardDosenScreen> {
  // controller teks per matkul & per mahasiswa
  final Map<String, Map<String, TextEditingController>> _controllers = {};

  @override
  void dispose() {
    for (var map in _controllers.values) {
      for (var c in map.values) {
        c.dispose();
      }
    }
    super.dispose();
  }

  /// 🔹 Dialog input nilai per mahasiswa
  void _showMahasiswaDialog(BuildContext context, String kodeMK) {
    final mahasiswaList = getMahasiswaByMataKuliah(kodeMK);

    // siapkan controller teks per mahasiswa
    _controllers[kodeMK] ??= {};
    for (var mhs in mahasiswaList) {
      _controllers[kodeMK]![mhs.nim] ??= TextEditingController(
        text: mhs.nilaiSemester[kodeMK]?.angka.toString() ?? '',
      );
    }

    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setStateDialog) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: const Text("Penilaian Mahasiswa"),
            content: mahasiswaList.isEmpty
                ? const Text(
                    "Belum ada mahasiswa yang mengambil mata kuliah ini.",
                  )
                : SizedBox(
                    width: double.maxFinite,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: mahasiswaList.length,
                      itemBuilder: (context, i) {
                        final mhs = mahasiswaList[i];
                        final controller = _controllers[kodeMK]![mhs.nim]!;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.brown[200],
                                child: Text(
                                  mhs.nama[0].toUpperCase(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      mhs.nama,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "NIM: ${mhs.nim}",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: 70,
                                child: TextField(
                                  controller: controller,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: "Angka",
                                    isDense: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Batal"),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text("Simpan Nilai"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[300],
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  // Ambil data MK dari dosen
                  final mk = widget.dosen.mataKuliah.firstWhere(
                    (m) => m.kode == kodeMK,
                    orElse: () =>
                        throw Exception("Mata kuliah $kodeMK tidak ditemukan"),
                  );

                  for (var mhs in mahasiswaList) {
                    final inputText =
                        _controllers[kodeMK]![mhs.nim]!.text.trim();
                    if (inputText.isNotEmpty) {
                      final angka = double.tryParse(inputText) ?? 0;

                      // Konversi angka ke huruf
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

                      // Simpan ke nilaiSemester mahasiswa
                      mhs.nilaiSemester[kodeMK] = Nilai(
                        nim: mhs.nim,
                        kodeMK: kodeMK,
                        namaMK: mk.nama,
                        angka: angka,
                        huruf: huruf,
                      );
                    }
                  }

                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text("✅ Nilai berhasil disimpan ke data mahasiswa!"),
                      backgroundColor: Colors.green,
                    ),
                  );
                  setState(() {}); // refresh UI utama
                },
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dosen = widget.dosen;
    final mataKuliahList = dosen.mataKuliah;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Dosen"),
        backgroundColor: Colors.brown[300],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Selamat Datang, ${dosen.nama} 👨‍🏫",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "📘 Mata Kuliah yang Anda Ampu:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: mataKuliahList.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final mk = mataKuliahList[index];
                  final mahasiswaList = getMahasiswaByMataKuliah(mk.kode);

                  return Card(
                    color: Colors.brown[50],
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: CircleAvatar(
                        backgroundColor: Colors.brown[300],
                        child: Text(
                          mk.kode.substring(0, 2),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        mk.nama,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 6),
                          Text("🕒 Jadwal: ${mk.jadwal.join(', ')}"),
                          Text(
                            "👥 ${mahasiswaList.length} Mahasiswa terdaftar",
                            style: TextStyle(
                              color: Colors.brown[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      trailing: ElevatedButton.icon(
                        onPressed: () => _showMahasiswaDialog(context, mk.kode),
                        icon: const Icon(Icons.people_alt),
                        label: const Text("Input Nilai"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown[300],
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

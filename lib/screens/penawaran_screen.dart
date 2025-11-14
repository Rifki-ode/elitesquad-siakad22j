// 📄 lib/screens/penawaran_screen.dart
import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/mahasiswa.dart';
import '../models/matakuliah.dart';

class PenawaranScreen extends StatefulWidget {
  final Mahasiswa mahasiswa;

  const PenawaranScreen({Key? key, required this.mahasiswa}) : super(key: key);

  @override
  State<PenawaranScreen> createState() => _PenawaranScreenState();
}

class _PenawaranScreenState extends State<PenawaranScreen> {
  List<MataKuliah> daftarTersedia = [];

  @override
  void initState() {
    super.initState();
    _loadMatakuliah();
  }

  void _loadMatakuliah() {
    final prodi = widget.mahasiswa.prodi.trim();
    final semester = widget.mahasiswa.semester;

    // Ambil matakuliah sesuai prodi & semester
    if (daftarMatakuliahPerProdi.containsKey(prodi)) {
      final dataProdi = daftarMatakuliahPerProdi[prodi]!;
      daftarTersedia = List<MataKuliah>.from(dataProdi[semester] ?? []);
    }

    setState(() {});
  }

  void _ambilAtauBatalkan(MataKuliah mk) {
    setState(() {
      if (widget.mahasiswa.jadwal.contains(mk)) {
        // ❌ Batalkan mata kuliah
        widget.mahasiswa.jadwal.remove(mk);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.brown[300],
            content: Text('❌ ${mk.nama} dibatalkan.'),
          ),
        );
      } else {
        // ✅ Ambil mata kuliah
        widget.mahasiswa.jadwal.add(mk);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.brown[700],
            content: Text('✅ ${mk.nama} berhasil diambil!'),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color coklatTua = const Color(0xFF5D4037);
    final Color coklatSusu = const Color(0xFFD7CCC8);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Penawaran Mata Kuliah'),
        backgroundColor: coklatTua,
      ),
      backgroundColor: coklatSusu,
      body: daftarTersedia.isEmpty
          ? const Center(
              child: Text(
                'Tidak ada mata kuliah tersedia untuk prodi dan semester ini.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: daftarTersedia.length,
              itemBuilder: (context, index) {
                final mk = daftarTersedia[index];
                final sudahDiambil =
                    widget.mahasiswa.jadwal.any((m) => m.kode == mk.kode);

                return Card(
                  color: sudahDiambil ? Colors.brown[100] : Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    title: Text(
                      mk.nama,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: coklatTua,
                      ),
                    ),
                    subtitle: Text(
                      '${mk.kode} • ${mk.sks} SKS\n'
                      'Dosen: ${mk.dosenPengampu}\n'
                      'Jadwal: ${mk.jadwal.join(", ")}',
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                    isThreeLine: true,
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            sudahDiambil ? Colors.red[400] : coklatTua,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => _ambilAtauBatalkan(mk),
                      child: Text(
                        sudahDiambil ? 'Batalkan' : 'Ambil Mata Kuliah',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

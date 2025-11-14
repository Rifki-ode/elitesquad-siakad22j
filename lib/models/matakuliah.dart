// lib/models/matakuliah.dart
class MataKuliah {
  final String kode;
  final String nama;
  final int sks;
  final String dosenPengampu;
  final int kapasitas;
  final List<String> jadwal; // contoh: ["Senin 08:00-10:00"]
  final String? prasyarat;

  // 🆕 Field tambahan opsional agar kompatibel dengan service
  final String? hari;
  final String? jamMulai;
  final String? jamSelesai;

  MataKuliah({
    required this.kode,
    required this.nama,
    required this.sks,
    required this.dosenPengampu,
    required this.kapasitas,
    required this.jadwal,
    this.prasyarat,
    this.hari,
    this.jamMulai,
    this.jamSelesai,
  });
}

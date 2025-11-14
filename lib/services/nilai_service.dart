// 📄 lib/services/nilai_service.dart
import 'package:flutter/foundation.dart';
import '../data/dummy_data.dart';
import '../models/nilai.dart';
import '../models/mahasiswa.dart';

class NilaiService with ChangeNotifier {
  // Map<nim, Map<kodeMK, Nilai>>
  final Map<String, Map<String, Nilai>> semuaNilai = {};

  void simpanNilai({
    required String nim,
    required String kodeMatkul,
    required String nilai,
  }) {
    final angka = _konversiHurufKeAngka(nilai);

    semuaNilai.putIfAbsent(nim, () => {});
    semuaNilai[nim]![kodeMatkul] = Nilai(
      nim: nim,
      kodeMK: kodeMatkul,
      namaMK: daftarMataKuliah
              .firstWhere((mk) => mk.kode == kodeMatkul,
                  orElse: () => throw Exception('MK tidak ditemukan'))
              .nama,
      angka: angka,
      huruf: nilai,
    );

    // 🔹 Update juga di daftarMahasiswa global
    final mhs = daftarMahasiswa.firstWhere(
      (m) => m.nim == nim,
      orElse: () => throw Exception("Mahasiswa tidak ditemukan"),
    );
    mhs.nilaiSemester[kodeMatkul] = semuaNilai[nim]![kodeMatkul]!;

    notifyListeners();
  }

  Nilai? getNilai(String nim, String kodeMatkul) {
    return semuaNilai[nim]?[kodeMatkul];
  }

  double _konversiHurufKeAngka(String huruf) {
    switch (huruf.toUpperCase()) {
      case 'A':
        return 90;
      case 'B':
        return 80;
      case 'C':
        return 70;
      case 'D':
        return 60;
      default:
        return 50;
    }
  }
}

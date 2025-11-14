// lib/models/dosen.dart
import 'matakuliah.dart';
import 'mahasiswa.dart';

class Dosen {
  final String nama;
  final String nidn;
  List<MataKuliah> mataKuliah;

  /// 🧾 Map: kodeMK -> daftar mahasiswa yang mengambil MK tersebut
  Map<String, List<Mahasiswa>> mahasiswaPerMatkul;

  Dosen({
    required this.nama,
    required this.nidn,
    this.mataKuliah = const [],
    Map<String, List<Mahasiswa>>? mahasiswaPerMatkul,
  }) : mahasiswaPerMatkul = mahasiswaPerMatkul ?? {};

  /// Tambahkan mahasiswa ke MK tertentu
  void tambahMahasiswa(String kodeMK, Mahasiswa mahasiswa) {
    mahasiswaPerMatkul.putIfAbsent(kodeMK, () => []);
    if (!mahasiswaPerMatkul[kodeMK]!.contains(mahasiswa)) {
      mahasiswaPerMatkul[kodeMK]!.add(mahasiswa);
    }
  }

  /// Ambil daftar mahasiswa untuk satu MK
  List<Mahasiswa> getMahasiswaByMatkul(String kodeMK) {
    return mahasiswaPerMatkul[kodeMK] ?? [];
  }
}

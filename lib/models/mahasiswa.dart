import 'matakuliah.dart';
import 'nilai.dart';

class Mahasiswa {
  final String nama;
  final String nim;
  final String prodi;
  final int semester;
  final List<MataKuliah> jadwal;

  Map<String, Nilai>? _nilaiSemester;

  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.semester,
    List<MataKuliah>? jadwal,
    Map<String, Nilai>? nilaiSemester,
  })  : jadwal = jadwal ?? [],
        _nilaiSemester = nilaiSemester;

  /// Getter agar aman dari null → selalu mengembalikan Map kosong
  Map<String, Nilai> get nilaiSemester {
    _nilaiSemester ??= <String, Nilai>{};
    return _nilaiSemester!;
  }

  /// Setter (kalau mau set seluruh map sekaligus)
  set nilaiSemester(Map<String, Nilai> newMap) {
    _nilaiSemester = newMap;
  }

  /// 🔹 Fungsi bantu: isi atau ubah nilai 1 mata kuliah
  void setNilai(String kodeMK, Nilai nilai) {
    final map = nilaiSemester; // non-null
    map[kodeMK] = nilai;
    _nilaiSemester = map;
  }
}

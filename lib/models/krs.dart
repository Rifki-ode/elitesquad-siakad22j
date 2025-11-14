// lib/models/krs.dart
import 'mahasiswa.dart';
import 'matakuliah.dart';

class KRS {
  final Mahasiswa mahasiswa;
  final MataKuliah mataKuliah;

  KRS({required this.mahasiswa, required this.mataKuliah});
}

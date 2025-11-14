import 'package:flutter/foundation.dart';
import '../data/dummy_data.dart';
import '../models/dosen.dart';

class DosenService extends ChangeNotifier {
  /// Cari dosen berdasarkan nama atau NIDN (longgar dan case-insensitive)
  Dosen? cariDosen(String nama, String nidn) {
    if (nama.isEmpty && nidn.isEmpty) return null;

    final namaLower = nama.toLowerCase().trim();
    final nidnTrim = nidn.trim();

    try {
      // Ambil dari daftarDosen agar mata kuliah juga ikut
      final Dosen dosen = daftarDosen.firstWhere(
        (d) =>
            d.nidn == nidnTrim ||
            d.nama.toLowerCase().replaceAll('.', '').replaceAll(',', '').contains(
                  namaLower.replaceAll('.', '').replaceAll(',', ''),
                ),
      );
      debugPrint("✅ Login Dosen: ${dosen.nama} (${dosen.mataKuliah.length} MK)");
      return dosen;
    } catch (e) {
      debugPrint("❌ Dosen tidak ditemukan");
      return null;
    }
  }
}

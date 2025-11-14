// 📂 lib/services/penawaran_service.dart

import 'package:flutter/material.dart';
import '../models/matakuliah.dart';
import '../models/penawaran.dart';
import 'notifikasi_service.dart';

class PenawaranService extends ChangeNotifier {
  // ======================================================
  // 🔹 DATA INTERNAL
  // ======================================================
  final List<Penawaran> _penawaran = []; // Riwayat pengambilan MK
  final Map<String, List<Map<String, dynamic>>> _mataKuliahDiambil = {}; // Untuk Dashboard

  List<Penawaran> get penawaranList => List.unmodifiable(_penawaran);

  // ======================================================
  // 🔹 MAHASISWA MENGAMBIL MATA KULIAH
  // ======================================================
  void ambilMatakuliah({
    required MataKuliah mk,
    required String nim,
    required String namaMahasiswa,
    NotifikasiService? notifikasi,
  }) {
    // Cek duplikasi pengambilan MK
    if (_penawaran.any((p) => p.kodeMK == mk.kode && p.nim == nim)) {
      notifikasi?.tambah("⚠️ ${mk.nama} sudah diambil sebelumnya.");
      return;
    }

    // Simpan ke daftar penawaran
    final data = Penawaran(
      kodeMK: mk.kode,
      namaMK: mk.nama,
      nim: nim,
      namaMahasiswa: namaMahasiswa,
      dosen: mk.dosenPengampu,
      status: StatusPenawaran.enrolled,
    );

    _penawaran.add(data);

    // Simpan ke jadwal khusus mahasiswa (Dashboard)
    if (!_mataKuliahDiambil.containsKey(nim)) {
      _mataKuliahDiambil[nim] = [];
    }

    // Hindari duplikasi jadwal
    final sudahAda = _mataKuliahDiambil[nim]!
        .any((item) => item['kodeMK'] == mk.kode);

    if (!sudahAda) {
      _mataKuliahDiambil[nim]!.add({
        'kodeMK': mk.kode,
        'namaMK': mk.nama,
        'hari': mk.hari ?? 'Belum dijadwalkan',
        'jamMulai': mk.jamMulai ?? '-',
        'jamSelesai': mk.jamSelesai ?? '-',
        'namaDosen': mk.dosenPengampu,
      });
    }

    notifikasi?.tambah("✅ ${mk.nama} berhasil diambil.");
    notifyListeners();
  }

  // ======================================================
  // 🔹 DROP / BATALKAN MATA KULIAH
  // ======================================================
  void dropMatakuliah(
    MataKuliah mk, {
    required String nim,
    NotifikasiService? notifikasi,
  }) {
    final before = _penawaran.length;

    _penawaran.removeWhere(
      (p) => p.kodeMK == mk.kode && p.nim == nim,
    );

    _mataKuliahDiambil[nim]
        ?.removeWhere((m) => m['kodeMK'] == mk.kode);

    final after = _penawaran.length;

    if (after < before) {
      notifikasi?.tambah("🗑️ ${mk.nama} berhasil di-drop.");
    } else {
      notifikasi?.tambah("❌ ${mk.nama} belum pernah diambil.");
    }

    notifyListeners();
  }

  // ======================================================
  // 🔹 DOSEN MELIHAT MAHASISWA DI MATA KULIAH
  // ======================================================
  List<Penawaran> getMahasiswaByMatkul(String namaMK, String dosen) {
    return _penawaran
        .where((p) => p.namaMK == namaMK && p.dosen == dosen)
        .toList();
  }

  // ======================================================
  // 🔹 AMBIL JADWAL MAHASISWA
  // ======================================================
  List<Map<String, dynamic>> getJadwalMahasiswa(String nim) {
    return _mataKuliahDiambil[nim] ?? [];
  }

  // ======================================================
  // 🔹 RESET DATA (UNTUK LOGOUT / TESTING)
  // ======================================================
  void reset() {
    _penawaran.clear();
    _mataKuliahDiambil.clear();
    notifyListeners();
  }
}

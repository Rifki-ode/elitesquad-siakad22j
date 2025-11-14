import 'package:flutter/material.dart';

/// Model notifikasi tunggal
class NotifikasiItem {
  final String pesan;
  final DateTime waktu;

  NotifikasiItem(this.pesan) : waktu = DateTime.now();
}

/// Service untuk daftar notifikasi
class NotifikasiService extends ChangeNotifier {
  final List<NotifikasiItem> _daftar = [];

  List<NotifikasiItem> get daftar => List.unmodifiable(_daftar);

  void tambah(String pesan) {
    _daftar.add(NotifikasiItem(pesan));
    notifyListeners();
  }

  void bersihkan() {
    _daftar.clear();
    notifyListeners();
  }
}

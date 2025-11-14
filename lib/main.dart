import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme.dart';
import 'screens/login_screen.dart';

// 🔹 Import semua services yang dibutuhkan
import 'services/penawaran_service.dart';
import 'services/nilai_service.dart';
import 'services/dosen_service.dart';
import 'services/notifikasi_service.dart';

void main() {
  runApp(const SiakadApp());
}

/// 🌐 Root aplikasi SIAKAD
/// Mengatur tema global, provider state, dan halaman awal (Login)
class SiakadApp extends StatelessWidget {
  const SiakadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// 🔸 Layanan pengambilan dan penawaran mata kuliah
        ChangeNotifierProvider(create: (_) => PenawaranService()),

        /// 🔸 Layanan pengelolaan nilai mahasiswa
        ChangeNotifierProvider(create: (_) => NilaiService()),

        /// 🔸 Layanan data & login dosen
        ChangeNotifierProvider(create: (_) => DosenService()),

        /// 🔸 Layanan notifikasi dalam aplikasi
        ChangeNotifierProvider(create: (_) => NotifikasiService()),
      ],
      child: MaterialApp(
        title: 'SIAKAD 22J',
        debugShowCheckedModeBanner: false,

        /// 🎨 Gunakan tema kampus dari file theme.dart
        theme: AppTheme.temaKampus,

        /// 🧑‍🎓 Halaman awal aplikasi
        home: const LoginScreen(),
      ),
    );
  }
}

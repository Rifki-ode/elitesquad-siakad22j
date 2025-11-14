import 'package:flutter/material.dart';

/// 🎓 Tema Kampus — Siakad 22J
/// Warna utama: coklat tua
/// Warna sekunder: coklat susu
/// Background: krem lembut
class AppTheme {
  // 🎨 Warna dasar
  static const Color coklatTua = Color(0xFF5D4037);
  static const Color coklatSusu = Color(0xFFD7CCC8);
  static const Color kremLembut = Color(0xFFF5F5DC);

  // 🌈 Tema utama
  static final ThemeData temaKampus = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: coklatTua,
      primary: coklatTua,
      secondary: coklatSusu,
      background: kremLembut,
    ),
    primaryColor: coklatTua,
    scaffoldBackgroundColor: kremLembut,
    appBarTheme: const AppBarTheme(
      backgroundColor: coklatTua,
      foregroundColor: Colors.white,
      elevation: 2,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    cardColor: coklatSusu,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.black87,
        fontSize: 16,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF3E2723),
        fontSize: 18,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: coklatTua,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: coklatSusu),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: coklatTua, width: 2),
      ),
      labelStyle: const TextStyle(color: coklatTua),
    ),
  );
}

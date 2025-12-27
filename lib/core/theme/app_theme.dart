import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    const background = Color(0xFF0B0D12);
    const surface = Color(0xFF111827);
    const accent = Color(0xFF38BDF8);

    final colorScheme = ColorScheme.fromSeed(
      seedColor: accent,
      brightness: Brightness.dark,
      surface: surface,
      background: background,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      textTheme: ThemeData.dark().textTheme.apply(
            bodyColor: const Color(0xFFE2E8F0),
            displayColor: Colors.white,
          ),
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF0F172A),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: Colors.white.withOpacity(0.08)),
        ),
      ),
    );
  }
}

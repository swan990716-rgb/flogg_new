import 'package:flutter/material.dart';

/// 앱 공통 테마 (Material 3, 라이트, 핑크 포인트)
ThemeData buildLightTheme() {
  const pink = Color(0xFFB4707B);
  final colorScheme = ColorScheme.fromSeed(
    seedColor: pink,
    brightness: Brightness.light,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: const Color(0xFFF7F7F9),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: false,
      toolbarHeight: 56,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    ),
    // Flutter 3.35+: CardThemeData
    cardTheme: const CardThemeData(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 3,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: colorScheme.primary),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: pink,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        elevation: 1,
      ),
    ),
  );
}

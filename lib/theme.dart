import 'package:flutter/material.dart';

const _red = Color(0xFFD2402F);
const _redSoft = Color(0xFFFBE3DF);
const solarisBlue = Color(0xFF1E3A5F);

ThemeData buildSolarisTheme() {
  final scheme = ColorScheme.fromSeed(seedColor: _red).copyWith(
    primary: _red,
    onPrimary: Colors.white,
    primaryContainer: _redSoft,
    onPrimaryContainer: _red,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: solarisBlue,
      foregroundColor: Colors.white,
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
    listTileTheme: ListTileThemeData(
      selectedColor: _red,
      selectedTileColor: _redSoft,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
        expansionTileTheme: const ExpansionTileThemeData(
      textColor: _red,
      iconColor: _red,
    ),
  );
}
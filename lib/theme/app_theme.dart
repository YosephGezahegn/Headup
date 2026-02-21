import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color background = Color(0xFFFFFDF7);
  static const Color primary = Color(0xFFFFCC00);
  static const Color secondary = Color(0xFF333333);
  
  static const Color ethioGreen = Color(0xFF009B4D);
  static const Color ethioYellow = Color(0xFFFEDD00);
  static const Color ethioRed = Color(0xFFEF3340);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        background: background,
      ),
      scaffoldBackgroundColor: background,
      textTheme: GoogleFonts.plusJakartaSansTextTheme().copyWith(
        displayLarge: GoogleFonts.notoSansEthiopic(
          fontWeight: FontWeight.bold,
          color: secondary,
        ),
        headlineMedium: GoogleFonts.notoSansEthiopic(
          fontWeight: FontWeight.bold,
          color: secondary,
        ),
        bodyLarge: GoogleFonts.notoSansEthiopic(
          color: secondary,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: secondary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: secondary,
          textStyle: GoogleFonts.notoSansEthiopic(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final base = ThemeData.light();

    return base.copyWith(
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.ubuntu(
          fontWeight: FontWeight.w700,
          fontSize: 30,
          color: const Color(0xFF252838),
        ),
        bodySmall: GoogleFonts.ubuntu(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: const Color(0xFF252838),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          surfaceTintColor: Colors.white,
          foregroundColor: const Color(0xFF252838),
          textStyle: GoogleFonts.ubuntu(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

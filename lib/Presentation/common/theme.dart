import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color darkBackground = Color(0xFF121212); // Slightly lighter than pure black
  static const Color cardColor = Color(0xFF1E1E1E);
  static const Color ownerAccent = Colors.blueAccent;
  static const Color staffAccent = Colors.orangeAccent;
  static const Color textBody = Colors.white70;
  static const Color textHeading = Colors.white;

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      primaryColor: ownerAccent,
      cardColor: cardColor,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        displayLarge: GoogleFonts.poppins(color: textHeading, fontWeight: FontWeight.bold),
        bodyLarge: GoogleFonts.poppins(color: textBody),
        bodyMedium: GoogleFonts.poppins(color: textBody),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ownerAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white.withOpacity(0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(color: Colors.white30),
      ),
    );
  }

  static BoxDecoration glassDecoration({double opacity = 0.05, double blur = 10}) {
    return BoxDecoration(
      color: Colors.white.withOpacity(opacity),
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: Colors.white.withOpacity(0.1)),
    );
  }

  static BoxDecoration luxuryGlass({double opacity = 0.1, double blur = 20}) {
    return BoxDecoration(
      color: Colors.white.withOpacity(opacity),
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: Colors.white.withOpacity(0.15)),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ],
    );
  }

  static LinearGradient get premiumGradient => const LinearGradient(
        colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  // Status Colors for Premium Badges
  static const Color statusConfirmed = Color(0xFF00FFA3);
  static const Color statusPending = Color(0xFFFFD600);
  static const Color statusCancelled = Color(0xFFFF4B4B);
}

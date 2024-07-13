import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
      displayMedium: GoogleFonts.montserrat(
        color: Colors.black87,
      ),
      titleSmall: GoogleFonts.poppins(color: Colors.black54, fontSize: 24));
  static TextTheme darkTextTheme = TextTheme(
      displaySmall: GoogleFonts.montserrat(
        color: const Color.fromRGBO(255, 255, 255, 0.702),
      ),
      titleSmall: GoogleFonts.poppins(color: Colors.white60, fontSize: 24));
}

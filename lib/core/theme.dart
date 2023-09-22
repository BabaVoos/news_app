import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  static ThemeData applicationTheme = ThemeData(
      primaryColor: const Color(0XFF39A552),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: const Color(0XFF39A552),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                50,
              ),
              bottomRight: Radius.circular(
                50,
              ),
            ),
          ),
          titleTextStyle: GoogleFonts.exo(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          )));
}

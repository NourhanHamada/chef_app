import 'package:chef_app/view/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

lightTheme(context) {
  return ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme)
        .apply()
        .copyWith(
    ),
    scaffoldBackgroundColor: whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: mainColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: whiteColor
    ),
  );
}

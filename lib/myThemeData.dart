import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/appColors.dart';

class Mythemedata {
  static  final ThemeData LightTheme = ThemeData(
      primaryColor: Appcolors.primaryColor,
      appBarTheme: AppBarTheme(
          backgroundColor: Appcolors.primaryColor,
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ))),
      textTheme: TextTheme(
          titleLarge: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Appcolors.whiteColor),
          titleMedium: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Appcolors.blackColor),
          bodyMedium: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Appcolors.blackColor,
          ),
          bodySmall: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Appcolors.blackColor)));
}

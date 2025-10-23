import 'package:flutter/material.dart';
import 'package:game_box/core/app%D9%80colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle headlineLarge = GoogleFonts.juliusSansOne(
    fontSize: 28,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );

  static  TextStyle headlineMedium = GoogleFonts.juliusSansOne(
    fontSize: 26,
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  );

  static  TextStyle headlineSmall = GoogleFonts.juliusSansOne(
    fontSize: 22,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );

  static TextStyle sectionTitle = GoogleFonts.poppins(
    fontSize: 20,
    color: AppColors.white,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    color: AppColors.white,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    color: AppColors.white,

    fontWeight: FontWeight.normal,
  );

  static TextStyle bodySmall = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.white,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle buttonPrimary = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static TextStyle buttonSecondary = GoogleFonts.poppins(
    fontSize: 20,
    color: AppColors.white,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle welcomeText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.blueAccent,
  );

  static const TextStyle errorText = TextStyle(
    fontSize: 14,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle successText = TextStyle(
    fontSize: 14,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle warningText = TextStyle(
    fontSize: 14,
    color: Colors.orange,
    fontWeight: FontWeight.w500,
  );

  static TextStyle caption = GoogleFonts.poppins(
    fontSize: 16, color: AppColors.white
    );
  static TextStyle captionBold = GoogleFonts.poppins(
    fontSize: 16, color: AppColors.white
    );

  static const TextStyle hint = TextStyle(
    fontSize: 16,
    color: AppColors.white,
  );
}

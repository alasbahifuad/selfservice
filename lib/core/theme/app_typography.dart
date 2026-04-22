import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  static TextStyle get headlineLatin => GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.bold,
      );

  static TextStyle get headlineArabic => GoogleFonts.ibmPlexSansArabic(
        fontWeight: FontWeight.bold,
      );

  static TextStyle get bodyLatin => GoogleFonts.workSans();

  static TextStyle get bodyArabic => GoogleFonts.cairo();

  static TextTheme get textTheme => TextTheme(
        displayLarge: headlineArabic.copyWith(fontSize: 30, color: AppColors.onSurface),
        displayMedium: headlineArabic.copyWith(fontSize: 24, color: AppColors.onSurface),
        displaySmall: headlineArabic.copyWith(fontSize: 20, color: AppColors.onSurface),
        headlineMedium: headlineArabic.copyWith(fontSize: 18, color: AppColors.onSurface),
        bodyLarge: bodyArabic.copyWith(fontSize: 16, color: AppColors.onSurface),
        bodyMedium: bodyArabic.copyWith(fontSize: 14, color: AppColors.onSurface),
        bodySmall: bodyArabic.copyWith(fontSize: 12, color: AppColors.onSurfaceVariant),
        labelLarge: bodyArabic.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
      );
}

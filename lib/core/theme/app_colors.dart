import 'package:flutter/material.dart';

class AppColors {
  // Primary
  static const Color primary = Color(0xFF904D00);
  static const Color primaryContainer = Color(0xFFFF8C00);
  static const Color onPrimary = Colors.white;
  static const Color onPrimaryContainer = Color(0xFF623200);
  static const Color primaryFixed = Color(0xFFFFDCC3);
  static const Color primaryFixedDim = Color(0xFFFFB77D);

  // Secondary
  static const Color secondary = Color(0xFF435B9F);
  static const Color secondaryContainer = Color(0xFF9CB4FE);
  static const Color onSecondary = Colors.white;

  // Tertiary
  static const Color tertiary = Color(0xFF00658F);
  static const Color tertiaryContainer = Color(0xFF00B5FC);

  // Surface System
  static const Color surface = Color(0xFFF8F9FA);
  static const Color background = Color(0xFFF8F9FA);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF3F4F5);
  static const Color surfaceContainer = Color(0xFFEDEEEF);
  static const Color surfaceContainerHigh = Color(0xFFE7E8E9);
  static const Color surfaceContainerHighest = Color(0xFFE1E3E4);
  static const Color inverseSurface = Color(0xFF2E3132);

  // Semantic
  static const Color error = Color(0xFFBA1A1A);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onSurface = Color(0xFF191C1D);
  static const Color onSurfaceVariant = Color(0xFF564334);
  static const Color outline = Color(0xFF897362);
  static const Color outlineVariant = Color(0xFFDDC1AE);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryContainer],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

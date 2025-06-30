import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_colors.dart';

class AppTheme {
  // Your existing light theme
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBg, // -->> لون الخلفية الفاتحة
      elevation: 0, // -->> إزالة الظل
      scrolledUnderElevation: 1, // -->> ظل خفيف يظهر عند السكرول فقط
      iconTheme: const IconThemeData(color: AppColors.textPrimary),
      titleTextStyle: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: 'Roboto',
      ),
    ),
    brightness: Brightness.light,
    primaryColor: AppColors.primaryBlueLight,
    scaffoldBackgroundColor: AppColors.lightBg,
    cardColor: AppColors.lightCard,
    hintColor: AppColors.accentTeal,
    fontFamily: 'Roboto',

    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 34,
      ),
      headlineLarge: TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 52,
      ),
      headlineMedium: TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 32,
      ),
      titleLarge: TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 34,
      ),
      titleMedium: TextStyle(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      bodyLarge: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 20,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textLightGrey,
        fontSize: 16,
        height: 1.4,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: const TextStyle(color: AppColors.textLightGrey),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: AppColors.primaryBlueLight,
          width: 2.0,
        ),
      ),
    ),
  );

  // --- NEW: The Dark Theme ---
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryBlueDark,
    scaffoldBackgroundColor: AppColors.black,
    cardColor: AppColors.darkCard,
    hintColor: AppColors.accentTeal,
    fontFamily: 'Roboto',

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBg, // -->> لون الخلفية الداكنة
      elevation: 0, // -->> إزالة الظل
      scrolledUnderElevation: 1, // -->> ظل خفيف يظهر عند السكرول فقط
      iconTheme: const IconThemeData(color: AppColors.textSecondary),
      titleTextStyle: TextStyle(
        color: AppColors.textSecondary,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: 'Roboto',
      ),
    ),

    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: AppColors.textSecondary,
        fontWeight: FontWeight.bold,
        fontSize: 34,
      ),
      headlineLarge: TextStyle(
        color: AppColors.textSecondary,
        fontWeight: FontWeight.bold,
        fontSize: 52,
      ),
      headlineMedium: TextStyle(
        color: AppColors.textSecondary,
        fontWeight: FontWeight.w600,
        fontSize: 32,
      ),
      titleLarge: TextStyle(
        color: AppColors.textSecondary,
        fontWeight: FontWeight.bold,
        fontSize: 34,
      ),
      titleMedium: TextStyle(
        color: AppColors.textSecondary,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      bodyLarge: TextStyle(
        color: AppColors.textSecondary,
        fontSize: 20,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textDarkGrey,
        fontSize: 16,
        height: 1.4,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkGrey,
      hintStyle: const TextStyle(color: AppColors.textDarkGrey),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.grey[700]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: Colors.grey[700]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          color: AppColors.primaryBlueLight,
          width: 2.0,
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/theme/app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData mainTheme = ThemeData(
    fontFamily: 'Montserrat',
    primaryColor: AppColors.colorCompanyPrimary,
    scaffoldBackgroundColor: AppColors.white,
    useMaterial3: true,

    // ColorScheme
    colorScheme: const ColorScheme.light(
      primary: AppColors.colorCompanyPrimary,
      secondary: AppColors.colorAccent,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      surface: AppColors.white,
      error: AppColors.mutedRed,
      onSurface: AppColors.black,
      onError: AppColors.white,
    ),

    // TextTheme
    textTheme: TextTheme(
      displayLarge: AppTextStyles.extraBold.copyWith(fontSize: 57),
      displayMedium: AppTextStyles.extraBold.copyWith(fontSize: 45),
      displaySmall: AppTextStyles.extraBold.copyWith(fontSize: 36),
      headlineLarge: AppTextStyles.bold.copyWith(fontSize: 32),
      headlineMedium: AppTextStyles.bold.copyWith(fontSize: 28),
      headlineSmall: AppTextStyles.bold.copyWith(fontSize: 24),
      titleLarge: AppTextStyles.bold.copyWith(fontSize: 22),
      titleMedium: AppTextStyles.bold.copyWith(fontSize: 16),
      titleSmall: AppTextStyles.bold.copyWith(fontSize: 14),
      bodyLarge: AppTextStyles.regular.copyWith(fontSize: 16),
      bodyMedium: AppTextStyles.regular.copyWith(fontSize: 14),
      bodySmall: AppTextStyles.regular.copyWith(fontSize: 12),
      labelLarge: AppTextStyles.bold.copyWith(fontSize: 14),
      labelMedium: AppTextStyles.bold.copyWith(fontSize: 12),
      labelSmall: AppTextStyles.regular.copyWith(fontSize: 11),
    ),

    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.colorAccent),
      titleTextStyle: AppTextStyles.bold.copyWith(
        fontSize: 18,
        color: AppColors.colorAccent,
      ),
    ),

    // ElevatedButton Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.colorCompanyPrimary,
        foregroundColor: AppColors.white,
        textStyle: AppTextStyles.bold.copyWith(fontSize: 16),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2,
      ),
    ),

    // OutlinedButton Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.colorCompanyPrimary,
        textStyle: AppTextStyles.bold.copyWith(fontSize: 16),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        side: const BorderSide(color: AppColors.colorCompanyPrimary, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),

    // InputDecoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightGrey,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.colorCompanyPrimary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.mutedRed),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.mutedRed, width: 2),
      ),
      labelStyle: AppTextStyles.regular.copyWith(color: AppColors.colorAccent),
      hintStyle: AppTextStyles.regular.copyWith(color: AppColors.disabledGrey),
      errorStyle: AppTextStyles.regular.copyWith(color: AppColors.mutedRed, fontSize: 12),
    ),

    // Card Theme
    cardTheme: CardThemeData(
      color: AppColors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(8),
    ),

    // Divider Theme
    dividerTheme: const DividerThemeData(
      color: AppColors.grey,
      thickness: 1,
      space: 16,
    ),
  );
}
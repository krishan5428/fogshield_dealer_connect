import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String _fontFamily = 'Montserrat';

  // Base text style with Montserrat font
  static const TextStyle _base = TextStyle(
    fontFamily: _fontFamily,
    color: AppColors.colorAccent,
  );

  // Regular text style
  static final TextStyle regular = _base.copyWith(
    fontWeight: FontWeight.w400,
  );

  // Bold text style (SemiBold)
  static final TextStyle bold = _base.copyWith(
    fontWeight: FontWeight.w600,
  );

  // Extra Bold text style
  static final TextStyle extraBold = _base.copyWith(
    fontWeight: FontWeight.w800,
  );

  // Light text style
  static final TextStyle light = _base.copyWith(
    fontWeight: FontWeight.w300,
  );

  // Thin text style
  static final TextStyle thin = _base.copyWith(
    fontWeight: FontWeight.w100,
  );

  // Medium text style
  static final TextStyle medium = _base.copyWith(
    fontWeight: FontWeight.w500,
  );
}
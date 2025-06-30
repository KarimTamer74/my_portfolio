import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/app_colors.dart';

abstract class AppStyles {
  static const String fontFamily = 'Roboto';

  static final TextStyle s12W400 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );
  static final TextStyle s14W400 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );
  static final TextStyle s16W400 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );
  static final TextStyle s18W400 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );
  static final TextStyle s20W400 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
  );

  //------------------------------------------------------------------
  // --- FONT WEIGHT: MEDIUM (w500) ---
  //------------------------------------------------------------------
  static final TextStyle s12W500 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );
  static final TextStyle s14W500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );
  static final TextStyle s16W500 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );
  static final TextStyle s18W500 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );
  static final TextStyle s20W500 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );

  //------------------------------------------------------------------
  // --- FONT WEIGHT: SEMI-BOLD (w600) ---
  //------------------------------------------------------------------
  static final TextStyle s12W600 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );
  static final TextStyle s14W600 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );
  static final TextStyle s16W600 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );
  static final TextStyle s18W600 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );
  static final TextStyle s24W600 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
  );


  static final TextStyle s12W700 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
  static final TextStyle s14W700 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
  static final TextStyle s16W700 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );static final TextStyle s17W700 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
  static final TextStyle s18W700 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
  static final TextStyle s20W700 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
  static final TextStyle s22W700 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
  static final TextStyle s24W700 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
  static final TextStyle s28W700 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
  static final TextStyle s32W700 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
  static final TextStyle s34W700 = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
  static final TextStyle s48W700 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );



  // --- White Text ---
  static final TextStyle s16W500White = s16W500.copyWith(
    color: AppColors.textSecondary,
  );
  static final TextStyle s20W400White = s20W400.copyWith(
    color: AppColors.textSecondary,
  );
  static final TextStyle s24W600White = s24W600.copyWith(
    color: AppColors.textSecondary,
  );
  static final TextStyle s32W700White = s32W700.copyWith(
    color: AppColors.textSecondary,
  );
  static final TextStyle s48W700White = s48W700.copyWith(
    color: AppColors.textSecondary,
  );

  // --- Grey Text ---
  static final TextStyle s14W400LightGrey = s14W400.copyWith(
    color: AppColors.textLightGrey,
  );
  static final TextStyle s16W400LightGrey = s16W400.copyWith(
    color: AppColors.textLightGrey,
  );

  static final TextStyle s14W400DarkGrey = s14W400.copyWith(
    color: AppColors.textDarkGrey,
  );
  static final TextStyle s16W400DarkGrey = s16W400.copyWith(
    color: AppColors.textDarkGrey,
  );

  // --- Primary Color Text ---
  static final TextStyle s16W700Primary = s16W700.copyWith(
    color: AppColors.primaryBlueLight,
  );
  static final TextStyle s24W700Primary = s24W700.copyWith(
    color: AppColors.primaryBlueLight,
  );
}

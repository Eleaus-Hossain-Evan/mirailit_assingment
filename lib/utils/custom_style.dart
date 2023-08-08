import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_palate.dart';

class CustomTextStyle {
  CustomTextStyle._();

  static CustomTextStyle get instance => CustomTextStyle._();

  static TextStyle textStyle32w600 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalate.black1000,
    letterSpacing: 1.80,
  );

  static TextStyle textStyle30w700 = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w900,
    color: ColorPalate.black1000,
    letterSpacing: 1.80,
  );

  static TextStyle textStyle24w700 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: ColorPalate.black1000,
  );

  static TextStyle textStyle18w600Black1000 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalate.black1000,
  );

  static TextStyle textStyle18w500Black1000 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.black1000,
  );

  static TextStyle textStyle18w500Red = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.error,
  );

  static TextStyle textStyle18w500Black800 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalate.black800,
  );

  static TextStyle textStyle16w600 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
  );

  static TextStyle textStyle16w600White = textStyle16w600.copyWith(
    color: ColorPalate.white,
  );

  static TextStyle textStyle16w600secondary = textStyle16w600.copyWith(
    color: ColorPalate.secondary,
  );

  static TextStyle textStyle16w600Black900 = textStyle16w600.copyWith(
    color: ColorPalate.black900,
    letterSpacing: 0,
  );

  static TextStyle textStyle16w600Black1000 = textStyle16w600.copyWith(
    color: ColorPalate.black1000,
    letterSpacing: .15,
  );

  static TextStyle textStyle16w500Black1000 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.black1000,
  );

  static TextStyle textStyle16w500Black900 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.black900,
  );

  static TextStyle textStyle16w400Black1000 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalate.black1000,
  );

  static TextStyle textStyle16w400Black900 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalate.black900,
  );

  static TextStyle textStyle16w400secondary = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalate.secondary,
  );
  static TextStyle textStyle16w400Primary = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalate.primary300,
  );

  static TextStyle textStyle14w600 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle textStyle14w600B600 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalate.black600,
  );

  static TextStyle textStyle14w600secondary = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalate.secondary,
  );

  static TextStyle textStyle14w500B1000 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.black1000,
  );

  static TextStyle textStyle14w500B900 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.black900,
  );

  static TextStyle textStyle14w500B800 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.black800,
  );

  static TextStyle textStyle14w500Red = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.error,
  );

  static TextStyle textStyle14w500Primary = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.primary,
  );

  static TextStyle textStyle14w400 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle textStyle14w400B900 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalate.black900,
  );

  static TextStyle textStyle14w400B800 = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalate.black800,
  );

  static TextStyle textStyle13w400B800 = GoogleFonts.inter(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalate.black800,
  );

  static TextStyle textStyle12w600Secondary = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalate.secondary,
  );

  static TextStyle textStyle12w600B1000 = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalate.black1000,
  );

  static TextStyle textStyle12w500Secondary = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.secondary,
  );

  static TextStyle textStyle12w500B800 = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: ColorPalate.black800,
  );

  static TextStyle textStyle12w400B800 = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: ColorPalate.black800,
  );

  static TextStyle textStyle10w600Secondary = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: ColorPalate.secondary,
  );

  static TextStyle textStyle8w600White = TextStyle(
    fontSize: 8.sp,
    fontWeight: FontWeight.w600,
  );
}

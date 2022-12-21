import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class FontConstant {
  static const String fontFamily = 'Almarai';
}

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}

TextStyle _getTextStyle({
  required double fontSize,
  required double letterSpacing,
  required FontWeight fontWeight,
  required Color color,
}) {
  return TextStyle(
    fontWeight: fontWeight,
    fontSize: fontSize,
    color: color,
    fontFamily: FontConstant.fontFamily,
    letterSpacing: letterSpacing,
  );
}

TextStyle getRegularStyle(
    {double fontSize = 12, required Color color, double letterSpacing = 1}) {
  return _getTextStyle(
      fontSize: fontSize.sp,
      fontWeight: FontWeightManager.regular,
      color: color,
      letterSpacing: letterSpacing.w);
}

TextStyle getBoldStyle(
    {double fontSize = 12, required Color color, double letterSpacing = 1}) {
  return _getTextStyle(
      fontSize: fontSize.sp,
      fontWeight: FontWeightManager.bold,
      color: color,
      letterSpacing: letterSpacing.w);
}

TextStyle getExtraBoldStyle(
    {double fontSize = 12, required Color color, double letterSpacing = 1}) {
  return _getTextStyle(
      fontSize: fontSize.sp,
      fontWeight: FontWeightManager.extraBold,
      color: color,
      letterSpacing: letterSpacing.w);
}

TextStyle getButtonActiveStyle() {
  return _getTextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeightManager.regular,
      color: white,
      letterSpacing: 0);
}

TextStyle getButtonNonActiveStyle() {
  return _getTextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeightManager.regular,
      color: primaryColor,
      letterSpacing: 0);
}

TextStyle getTitleScreenStyle() {
  return _getTextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeightManager.bold,
      color: black,
      letterSpacing: 0);
}

TextStyle getDescriptionGreyStyle({double? fontSize}) {
  return _getTextStyle(
      fontSize: fontSize ?? 14.sp,
      fontWeight: FontWeightManager.regular,
      color: grey,
      letterSpacing: 0);
}
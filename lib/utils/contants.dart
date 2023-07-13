import 'package:flutter/material.dart';
import 'package:tribehire_assessment/Utils/colors.dart';

class AppConstants {
  static const double fontSmall = 12.0;
  static const double fontNormal = 14.0;
  static const double fontBig = 16.0;
  static const double fontExtraBig = 22.0;

  static const FontWeight fontWeightLight = FontWeight.w400;
  static const FontWeight fontWeightNormal = FontWeight.normal;
  static const FontWeight fontWeightBold = FontWeight.bold;

  static textStyle({
    double fontSize = fontNormal,
    FontWeight fontWeight = fontWeightNormal,
    Color color = ColorChoice.black,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}

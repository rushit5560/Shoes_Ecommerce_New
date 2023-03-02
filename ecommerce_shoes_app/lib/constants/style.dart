import 'package:ecommerce_shoes_app/constants/colors.dart';
import 'package:flutter/material.dart';

class TextStyleConfig {
  static TextStyle textStyle({
    Color textColor = AppColors.blackColor,
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 15.0,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle drawerTextStyle({
    Color textColor = AppColors.blackColor,
    FontWeight fontWeight = FontWeight.w500,
    double fontSize = 18.0,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}

import 'package:crud_operations/utils/colorr.dart';
import 'package:flutter/material.dart';

class Styles {
  Styles._();

  static TextStyle txtRegular(
      {Color? color,
      double? fontSize,
      FontWeight? fontWeight,
      Color? decorationColor,
      TextDecoration? decoration}) {
    return TextStyle(

        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color,
        decorationColor: decorationColor,
        decoration: decoration);
  }

  static TextStyle txtMedium(
      {Color? color,
      double? fontSize,
      FontWeight? fontWeight,
      Color? decorationColor,
      TextDecoration? decoration}) {
    return TextStyle(

        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color,
        decorationColor: decorationColor,
        decoration: decoration);
  }

  static TextStyle txtBold(
      {Color? color,
      double? fontSize,
      FontWeight? fontWeight,
      Color? decorationColor,
      TextDecoration? decoration}) {
    return TextStyle(

        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color,
        decorationColor: decorationColor,
        decoration: decoration);
  }

  static TextStyle txtLight(
      {Color? color, double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(

        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w300,
        color: color);
  }

  static BoxDecoration boxDecoration(
      {Color? color, Color? borderColor, double? radius}) {
    return BoxDecoration(
        color: color,
        border: Border.all(color: borderColor ?? Colorr.grey10),
        borderRadius: BorderRadius.circular(radius ?? 5));
  }
}

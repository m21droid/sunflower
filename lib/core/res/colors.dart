import 'package:flutter/material.dart';

abstract class AppColors {
  AppColors._();

  static const MaterialColor primary = MaterialColor(
    0xFF6DC790,
    <int, Color>{
      50: Color(0xFF6DC790),
      100: Color(0xFF6DC790),
      200: Color(0xFF6DC790),
      300: Color(0xFF6DC790),
      400: Color(0xFF6DC790),
      500: Color(0xFF6DC790),
      600: Color(0xFF6DC790),
      700: Color(0xFF6DC790),
      800: Color(0xFF6DC790),
      900: Color(0xFF6DC790),
    },
  );

  static const Color background = Color(0xFF6DC790);
  static const Color secondary = Color(0xFFF8F99F);
  static const Color dark = Color(0xFF005D2B);
  static const Color button = Color(0xFFFAFAFA);

  static const Color primaryText = Color(0xFF000000);
  static const Color secondaryText = Color(0xFF005D2B);
  static const Color tertiaryText = Color(0xFF888888);
}

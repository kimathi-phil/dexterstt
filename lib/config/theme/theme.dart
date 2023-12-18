import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../constants/constants.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get defaultLightTheme {
    return ThemeData(
      primarySwatch: blackSwatch,
      dividerColor: kBlackColor800,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        background: kWhiteColor,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Inter',
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: kBlackColor900,
          fontSize: 54,
          fontWeight: FontWeight.w700,
        ),
        displayMedium: TextStyle(
          color: kBlackColor900,
          fontSize: 44,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
          height: size,
        ),
        displaySmall: TextStyle(
          color: kBlackColor900,
          fontSize: 34,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),
        headlineLarge: TextStyle(
          color: kBlackColor900,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),
        headlineMedium: TextStyle(
          color: kBlackColor900,
          fontSize: 22,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),
        headlineSmall: TextStyle(
          color: kBlackColor900,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),
        titleLarge: TextStyle(
          color: kBlackColor900,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),
        titleMedium: TextStyle(
          color: kBlackColor900,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),
        titleSmall: TextStyle(
          color: kBlackColor900,
          fontSize: 14,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),
        bodyLarge: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
        ),
        bodyMedium: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        ),
        bodySmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_blood_donation/utils/app_colors.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: whiteClr,
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: whiteClr,
    onPrimary: darkGreyClr,

    secondary: darkGreyClr,
    onSecondary: whiteClr,

    error: Colors.red,
    onError: lightFontColor,
    surface: lightContainerColor,
    //onSurface is default text color
    onSurface: blackClr,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.normal,
      fontFamily: 'Gumela Arabic',
      height: 1,
    ),
    bodyMedium: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.normal,
      fontFamily: 'Gumela Arabic',
      height: 1,
    ),
    bodySmall: TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.normal,
      fontFamily: 'Gumela Arabic',
      height: 1,
    ),
    titleLarge: TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.bold,
      fontFamily: 'Gumela Arabic',
      height: 1,
    ),
    titleMedium: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      fontFamily: 'Gumela Arabic',
      height: 1,
    ),
    titleSmall: TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.bold,
      fontFamily: 'Gumela Arabic',
      height: 1,
    ),
  ),
);
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: blackClr,
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: blackClr,
    onPrimary: lightGreyClr,

    secondary: lightGreyClr,
    onSecondary: blackClr,

    error: Colors.red,
    onError: darkFontColor,

    surface: darkContainerColor,
    // onSurface is default text color
    onSurface: whiteClr,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.normal,
      fontFamily: 'Gumela Arabic',
      height: 1,
    ),
    bodyMedium: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.normal,
      fontFamily: 'Gumela Arabic',
      height: 1,
    ),
    bodySmall: TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.normal,
      fontFamily: 'Gumela Arabic',
      height: 1,
    ),
    titleLarge: TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.bold,
      fontFamily: 'Gumela Arabic',
      height: 1,
    ),
    titleMedium: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      fontFamily: 'Gumela Arabic',
      height: 1,
    ),
    titleSmall: TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.bold,
      fontFamily: 'Gumela Arabic',
      height: 1,
    ),
  ),
);

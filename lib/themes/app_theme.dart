import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_blood_donation/utils/app_colors.dart';

final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBgClr,
    useMaterial3: true,
    fontFamily: 'Gumela Arabic',
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primaryClr,
        onPrimary: lightFontClr,
        secondary: lightCardClr,
        onSecondary: lightFontClr,
        error: primaryClr,
        onError: lightBgClr,
        surface: lightCardClr,
        onSurface: lightFontClr),
    textTheme: TextTheme(
      bodyLarge:
          TextStyle(fontSize: 25.sp, fontWeight: FontWeight.normal, height: 1),
      bodyMedium:
          TextStyle(fontSize: 20.sp, fontWeight: FontWeight.normal, height: 1),
      bodySmall:
          TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal, height: 1),
      titleLarge:
          TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold, height: 1),
      titleMedium:
          TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, height: 1),
      titleSmall:
          TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, height: 1),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: lightBgClr,
      foregroundColor: darkBgClr,
    ),
    navigationBarTheme: NavigationBarThemeData(
        iconTheme:
            const WidgetStatePropertyAll(IconThemeData(color: lightFontClr)),
        labelTextStyle: WidgetStatePropertyAll(TextStyle(
            fontSize: 18.sp, fontWeight: FontWeight.bold, color: lightFontClr)),
        shadowColor: lightCardClr,
        backgroundColor: lightBgClr,
        indicatorColor: primaryClr.withValues(alpha: 0.5)),
    cardColor: lightCardClr,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: lightBgClr,
    hintStyle: TextStyle(fontSize: 20.sp, color: lightBorderClr, fontFamily: 'Gumela Arabic', fontWeight: FontWeight.normal),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: lightBorderClr, width: 1.w),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: lightBorderClr, width: 1.w),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: lightBorderClr, width: 1.w),
    ),
  )
);


final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: darkBgClr,
  fontFamily: 'Gumela Arabic',
  useMaterial3: true,
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: primaryClr,
      onPrimary: darkFontClr,
      secondary: darkCardClr,
      onSecondary: darkFontClr,
      error: primaryClr,
      onError: lightBgClr,
      surface: darkCardClr,
      onSurface: darkFontClr),
  textTheme: TextTheme(
    bodyLarge:
        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.normal, height: 1),
    bodyMedium:
        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.normal, height: 1),
    bodySmall:
        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal, height: 1),
    titleLarge:
        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold, height: 1),
    titleMedium:
        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, height: 1),
    titleSmall:
        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, height: 1),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: darkBgClr,
    foregroundColor: lightBgClr,
  ),
  navigationBarTheme: NavigationBarThemeData(
      iconTheme:
          const WidgetStatePropertyAll(IconThemeData(color: darkFontClr)),
      labelTextStyle: WidgetStatePropertyAll(TextStyle(
          fontSize: 18.sp, fontWeight: FontWeight.bold, color: darkFontClr)),
      shadowColor: darkBgClr,
      backgroundColor: darkCardClr,
      indicatorColor: primaryClr.withValues(alpha: 0.5)),
  cardColor: darkCardClr,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkBgClr,
      hintStyle: TextStyle(fontSize: 15.sp, color: Colors.red, fontFamily: 'Gumela Arabic', fontWeight: FontWeight.normal),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: darkBorderClr, width: 1.w),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: darkBorderClr, width: 1.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: darkBorderClr, width: 1.w),
      ),
    )
);

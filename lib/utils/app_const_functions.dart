import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:free_blood_donation/utils/app_colors.dart';
import 'package:get/get.dart';

class AppConstFunctions{
   static customErrorMessage({required dynamic message}) {
    return Get.snackbar('Error', message,
        icon: const Icon(Icons.error_outline, color: lightFontClr),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        duration: const Duration(seconds: 2),
        colorText: lightFontClr);
  }

  static customSuccessMessage({required dynamic message}) {
    return Get.snackbar('Success', message,
        icon: const Icon(Icons.verified_outlined, color: lightFontClr),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        duration: const Duration(seconds: 2),
        colorText: lightFontClr);
  }

  static final  customCircularProgressIndicator =
  SpinKitSpinningLines(color: primaryClr, size: 36.0.r);
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {

  final String hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly;
  final String? Function(String?)? validator;
  final TextInputType? keyBoardType;
  final int? maxLines;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.validator,
    this.keyBoardType,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Get.textTheme.bodyMedium,
      controller: controller,
      cursorColor: Get.theme.colorScheme.onSurface,
      readOnly: readOnly,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyBoardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Get.textTheme.bodyMedium!.copyWith(color: Get.theme.colorScheme.secondary),
        fillColor: Get.theme.colorScheme.primary,
        filled: true,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Get.theme.colorScheme.onPrimary, width: 1.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Get.theme.colorScheme.onPrimary, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Get.theme.colorScheme.onPrimary, width: 1.w),
        ),
      ),
    );
  }
}

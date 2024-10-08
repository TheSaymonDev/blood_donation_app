import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {

  final String hintText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final bool readOnly;
  final String? Function(String?)? validator;
  final TextInputType? keyBoardType;
  final int? maxLines;
  final void Function()? onTap;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.validator,
    this.keyBoardType,
    this.maxLines = 1,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
     style: Theme.of(context).textTheme.bodyMedium,
      controller: controller,
      readOnly: readOnly,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyBoardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      ),
    );
  }
}

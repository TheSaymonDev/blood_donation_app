import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_blood_donation/screens/mobile_verification_screen/widgets/wave_clipper.dart';
import 'package:free_blood_donation/utils/app_colors.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;
  final double waveHeight;
  final Color backgroundColor;

  const CustomBackground({
    super.key,
    required this.child,
    this.waveHeight = 140,
    this.backgroundColor = primaryClr,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            height: waveHeight.h,
            width: double.infinity.w,
            color: backgroundColor,
          ),
        ),
        child,
      ],
    );
  }
}

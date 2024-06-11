import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {

  final double height;
  final double width;
  final Widget child;
  final Color? cardClr;

  const CustomCard({
    super.key,
    required this.height,
    this.width = double.infinity,
    this.cardClr,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: cardClr,
            borderRadius: BorderRadius.circular(12.r),
        ),
        child: child,
      ),
    );
  }
}
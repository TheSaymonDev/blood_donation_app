import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity.h,
      width: double.infinity.w,
      padding: EdgeInsets.only(top: 90.h, left: 16.w, right: 16.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(width: double.infinity, height: 200, color: Colors.yellow,),
            Gap(10.h),
            Container(width: double.infinity, height: 200, color: Colors.yellow,),
            Gap(10.h),
            Container(width: double.infinity, height: 200, color: Colors.yellow,),
            Gap(10.h),
            Container(width: double.infinity, height: 200, color: Colors.yellow,),
            Gap(10.h),
            Container(width: double.infinity, height: 200, color: Colors.yellow,),
            Gap(10.h),
            Container(width: double.infinity, height: 200, color: Colors.yellow,),
            Gap(10.h),
            Container(width: double.infinity, height: 200, color: Colors.yellow,),
            Gap(10.h),
          ],
        ),
      ),
    );
  }
}

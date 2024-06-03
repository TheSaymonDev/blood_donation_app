import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_blood_donation/routes/app_routes.dart';
import 'package:free_blood_donation/screens/onboarding_screen/models/onboarding_data.dart';
import 'package:free_blood_donation/utils/app_colors.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        itemCount: OnboardingData.screenData.length,
        itemBuilder: (index) => Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          height: double.infinity.h,
          width: double.infinity.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                OnboardingData.screenData[index].title.tr,
                style: Get.textTheme.titleLarge!.copyWith(color: whiteClr),
              ),
              Gap(24.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: whiteClr.withOpacity(0.3),
                ),
                child: Image.asset(
                  OnboardingData.screenData[index].imgPath,
                  width: 180.w,
                ),
              ),
              Gap(24.h),
              Text(
                OnboardingData.screenData[index].subTitle.tr,
                style: Get.textTheme.bodyLarge!.copyWith(color: whiteClr),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        colors: OnboardingData.screenData.map((data) => data.color).toList(),
        nextButtonBuilder: (context) => const Icon(Icons.arrow_forward_ios),
        onFinish: (){
          Get.offNamed(AppRoutes.homeScreen);
        },
      ),
    );
  }
}

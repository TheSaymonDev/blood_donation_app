import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_blood_donation/routes/app_routes.dart';
import 'package:free_blood_donation/screens/otp_verification_screen/controllers/otp_controller.dart';
import 'package:free_blood_donation/screens/otp_verification_screen/models/otp_model.dart';
import 'package:free_blood_donation/utils/app_colors.dart';
import 'package:free_blood_donation/utils/app_const_functions.dart';
import 'package:free_blood_donation/utils/app_urls.dart';
import 'package:free_blood_donation/widgets/custom_app_bar.dart';
import 'package:free_blood_donation/widgets/custom_elevated_button.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatelessWidget {
   OtpVerificationScreen({super.key});

   final _otpVerificationController = Get.find<OtpVerificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onPressed: () {
        Get.back();
      }, title: 'otpAppbar'.tr),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(100.h),
            Image.asset(AppUrls.otpPng, width: 200.w),
            Gap(32.h),
            Text('verification'.tr,
                style: Theme.of(context).textTheme.titleLarge),
            Gap(16.h),
            Text('otpMessage'.tr,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center),
            Text('+88${_otpVerificationController.phone}',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center),
            Gap(32.h),
            Container(
                width: 243.w,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: lightBgClr,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Pinput(
                    length: 4,
                    controller: _otpVerificationController.otpController,
                    focusNode: _otpVerificationController.focusNode,
                    separatorBuilder: (index) => Container(
                        height: 64.h, width: 1.w, color: lightBgClr),
                    defaultPinTheme: defaultPinTheme,
                    showCursor: true,
                    focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: const BoxDecoration(color: primaryClr)))),
            Gap(32.h),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: GetBuilder<OtpVerificationController>(
                    builder: (controller) => controller.isLoading
                        ? AppConstFunctions.customCircularProgressIndicator
                        : CustomElevatedButton(
                            onPressed: () {
                              _formOnSubmit(controller);
                            },
                            name: 'verify'.tr)))
          ],
        ),
      ),
    );
  }

  final defaultPinTheme = PinTheme(
      width: 60.w,
      height: 64.h,
      textStyle: Get.textTheme.titleMedium!.copyWith(color: lightBgClr),
      decoration: BoxDecoration(color: primaryClr.withValues(alpha: 0.5)));

  void _formOnSubmit(OtpVerificationController controller) async {
    final result = await controller.verifyOtp(
        otpData: OtpModel(phone: controller.phone, otp: controller.otpController.text));
    if (result) {
      Get.toNamed(AppRoutes.registrationScreen, arguments: {'phone': controller.phone});
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_blood_donation/routes/app_routes.dart';
import 'package:free_blood_donation/utils/app_colors.dart';
import 'package:free_blood_donation/utils/app_urls.dart';
import 'package:free_blood_donation/widgets/custom_app_bar.dart';
import 'package:free_blood_donation/widgets/custom_background.dart';
import 'package:free_blood_donation/widgets/custom_elevated_button.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  final _mobileNo = '01643831739';
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(onPressed: (){}, title: 'otpAppbar'.tr),
      body: CustomBackground(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(200.h),
              Image.asset(AppUrls.otpPng, width: 200.w),
              Gap(32.h),
              Text('verification'.tr, style: Theme.of(context).textTheme.titleLarge),
              Gap(16.h),
              Text(
                  'otpMessage'.tr,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
              Text(
                  '+88$_mobileNo',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center),
              Gap(32.h),
              Container(
                  width: 243.w,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: lightBgClr, borderRadius: BorderRadius.circular(12.r)),
                  child: Pinput(
                      length: 4,
                      controller: controller,
                      focusNode: focusNode,
                      separatorBuilder: (index) =>
                          Container(height: 64.h, width: 1.w, color: lightBgClr),
                      defaultPinTheme: defaultPinTheme,
                      showCursor: true,
                      focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: const BoxDecoration(color: primaryClr)))),
              Gap(32.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomElevatedButton(onPressed: (){
                  Get.toNamed(AppRoutes.registrationScreen);
                }, name: 'verify'.tr)
              )
            ],
          ),
        ),
      ),
    );
  }

  final defaultPinTheme = PinTheme(
      width: 60.w,
      height: 64.h,
      textStyle: Get.textTheme.titleMedium!.copyWith(color: lightBgClr),
      decoration: BoxDecoration(color: primaryClr.withOpacity(0.5)));
}

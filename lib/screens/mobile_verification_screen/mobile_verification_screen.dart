import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:free_blood_donation/routes/app_routes.dart';
import 'package:free_blood_donation/utils/app_colors.dart';
import 'package:free_blood_donation/widgets/custom_app_bar.dart';
import 'package:free_blood_donation/widgets/custom_elevated_button.dart';
import 'package:free_blood_donation/widgets/custom_text_form_field.dart';
import 'package:free_blood_donation/widgets/custom_background.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class MobileVerificationScreen extends StatelessWidget {
  MobileVerificationScreen({super.key});

  final _mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
          onPressed: () {
            Get.back();
          },
          title: 'mobileAppbar'.tr),
      body: CustomBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(200.h),
                Align(
                    alignment: Alignment.center,
                    child: FaIcon(FontAwesomeIcons.handHoldingDroplet,
                        color: primaryClr, size: 100.sp)),
                Gap(16.h),
                Align(
                    alignment: Alignment.center,
                    child: Text('appName'.tr,
                        style: Theme.of(context).textTheme.titleLarge!
                            .copyWith(fontSize: 35.sp))),
                Gap(100.h),
                Text('welcome'.tr, style: Theme.of(context).textTheme.titleLarge),
                Gap(8.h),
                Text('mobileVerifyTitle'.tr, style: Theme.of(context).textTheme.bodyMedium),
                Gap(24.h),
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Text('+88', style: Theme.of(context).textTheme.titleMedium),
                  Gap(16.w),
                  Expanded(
                      child: CustomTextFormField(
                          hintText: 'mobileHint'.tr,
                          controller: _mobileNumberController,
                          keyBoardType: TextInputType.phone))
                ]),
                Gap(24.h),
                CustomElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.otpVerificationScreen);
                    },
                    name: 'continue'.tr),
                Gap(16.h),
                Align(
                    alignment: Alignment.center,
                    child: Text('messageMobileVerify'.tr,
                        style: Theme.of(context).textTheme.bodySmall))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

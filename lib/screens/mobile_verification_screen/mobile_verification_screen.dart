import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:free_blood_donation/screens/mobile_verification_screen/widgets/wave_clipper.dart';
import 'package:free_blood_donation/utils/app_colors.dart';
import 'package:free_blood_donation/widgets/custom_elevated_button.dart';
import 'package:free_blood_donation/widgets/custom_text_form_field.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class MobileVerificationScreen extends StatelessWidget {
  MobileVerificationScreen({super.key});

  final _mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity.h,
        width: double.infinity.w,
        child: Stack(
          children: [
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: 600.h,
                width: double.infinity.w,
                color: redColor.withOpacity(0.7),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Align(
                      alignment: Alignment.center,
                      child: FaIcon(
                        FontAwesomeIcons.handHoldingDroplet,
                        color: const Color(0xFF880808),
                        size: 100.sp,
                      )),
                  Gap(16.h),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Free Blood Donation',
                        style: Get.textTheme.titleLarge!
                            .copyWith(color: whiteClr, fontSize: 35.sp),
                      )),
                  const Spacer(),
                  Text('Welcome', style: Get.textTheme.titleLarge),
                  Gap(8.h),
                  Text('Please enter your mobile number to continue',
                      style: Get.textTheme.bodyMedium),
                  Gap(24.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '+88',
                        style: Get.textTheme.titleMedium,
                      ),
                      Gap(16.w),
                      Expanded(
                          child: CustomTextFormField(
                              hintText: 'Enter Your Mobile Number',
                              controller: _mobileNumberController)),
                    ],
                  ),
                  Gap(24.h),
                  CustomElevatedButton(onPressed: () {}, name: 'Continue'),
                  Gap(16.h),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                          'By clicking continue you proceed to the verification',
                          style: Get.textTheme.bodySmall)),
                  Gap(48.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

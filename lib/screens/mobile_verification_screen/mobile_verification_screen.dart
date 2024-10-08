import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:free_blood_donation/routes/app_routes.dart';
import 'package:free_blood_donation/screens/mobile_verification_screen/controller/find_user_controller.dart';
import 'package:free_blood_donation/screens/mobile_verification_screen/models/find_user_model.dart';
import 'package:free_blood_donation/utils/app_colors.dart';
import 'package:free_blood_donation/utils/app_const_functions.dart';
import 'package:free_blood_donation/utils/app_validations.dart';
import 'package:free_blood_donation/widgets/custom_app_bar.dart';
import 'package:free_blood_donation/widgets/custom_elevated_button.dart';
import 'package:free_blood_donation/widgets/custom_text_form_field.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class MobileVerificationScreen extends StatelessWidget {
  MobileVerificationScreen({super.key});

  final _findUserController = Get.find<FindUserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          onPressed: () {
            Get.back();
          },
          title: 'mobileAppbar'.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Form(
            key: _findUserController.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(100.h),
                Align(
                    alignment: Alignment.center,
                    child: FaIcon(FontAwesomeIcons.handHoldingDroplet,
                        color: primaryClr, size: 100.sp)),
                Gap(16.h),
                Align(
                    alignment: Alignment.center,
                    child: Text('appName'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 35.sp))),
                Gap(100.h),
                Text('welcome'.tr, style: Theme.of(context).textTheme.titleLarge),
                Gap(8.h),
                Text('mobileVerifyTitle'.tr,
                    style: Theme.of(context).textTheme.bodyMedium),
                Gap(24.h),
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Text('+88', style: Theme.of(context).textTheme.bodyMedium),
                  Gap(16.w),
                  Expanded(
                      child: CustomTextFormField(
                          hintText: 'mobileHint'.tr,
                          controller: _findUserController.phoneController,
                          keyBoardType: TextInputType.phone,
                          validator: AppValidators.phoneValidator))
                ]),
                Gap(24.h),
                GetBuilder<FindUserController>(
                    builder: (controller) => controller.isLoading
                        ? AppConstFunctions.customCircularProgressIndicator
                        : CustomElevatedButton(
                            onPressed: () {
                              _formOnSubmit(controller);
                            },
                            name: 'continue'.tr)),
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

  void _formOnSubmit(FindUserController controller) async {
    if(controller.formKey.currentState!.validate()){
      final result = await controller.findUser(
          findUserData: FindUserModel(phone: controller.phoneController.text));
      if (result == 'Otp Sent SuccessFully') {
        Get.toNamed(AppRoutes.otpVerificationScreen,
            arguments: {'phone': controller.phoneController.text});
      } else if (result == 'User Already Exists') {
        Get.toNamed(AppRoutes.loginScreen,
            arguments: {'phone': controller.phoneController.text});
      } else {
        return;
      }
    }
  }
}

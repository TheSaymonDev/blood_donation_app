import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:free_blood_donation/routes/app_routes.dart';
import 'package:free_blood_donation/screens/registration_screen/controllers/registration_controller.dart';
import 'package:free_blood_donation/screens/registration_screen/models/registration_model.dart';
import 'package:free_blood_donation/utils/app_colors.dart';
import 'package:free_blood_donation/utils/app_const_functions.dart';
import 'package:free_blood_donation/utils/app_validations.dart';
import 'package:free_blood_donation/widgets/custom_app_bar.dart';
import 'package:free_blood_donation/widgets/custom_elevated_button.dart';
import 'package:free_blood_donation/widgets/custom_text_form_field.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final _registrationController = Get.find<RegistrationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          onPressed: () {
            Get.back();
          },
          title: 'registrationAppbar'.tr),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Form(
            key: _registrationController.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(16.h),
                GetBuilder<RegistrationController>(builder: (controller) {
                  return Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                          onTap: () {
                            controller.getImageFromGallery();
                          },
                          child: Stack(
                            children: [
                              SizedBox(
                                  height: 110.h,
                                  width: 110.w,
                                  child: controller.imageFile != null
                                      ? CircleAvatar(
                                          backgroundImage:
                                              FileImage(controller.imageFile!),
                                        )
                                      : CircleAvatar(
                                          backgroundColor:
                                              primaryClr.withValues(alpha: 0.8),
                                          child: FaIcon(
                                              FontAwesomeIcons.userLarge,
                                              color: lightBgClr,
                                              size: 55.sp))),
                              Positioned(
                                  top: 4,
                                  right: 4,
                                  child: CircleAvatar(
                                      radius: 17.r,
                                      backgroundColor: primaryClr,
                                      child: Icon(Icons.camera_alt,
                                          color: lightBgClr, size: 17.sp)))
                            ],
                          )));
                }),
                Gap(32.h),
                CustomTextFormField(
                    hintText: 'fullName'.tr,
                    controller: _registrationController.nameController,
                    validator: AppValidators.nameValidator),
                Gap(16.h),
                CustomTextFormField(
                    hintText: 'location'.tr,
                    controller: _registrationController.locationController,
                    validator: AppValidators.locationValidator,
                    prefixIcon: Icon(Icons.location_on_outlined, size: 25.sp)),
                Gap(16.h),
                CustomTextFormField(
                    hintText: 'registerPinHint'.tr,
                    controller: _registrationController.pinController,
                    keyBoardType: TextInputType.phone,
                    validator: AppValidators.pinValidator),
                Gap(32.h),
                Text('selectGender'.tr,
                    style: Theme.of(context).textTheme.titleMedium),
                Gap(8.h),
                GetBuilder<RegistrationController>(builder: (controller) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      controller.gender.length,
                      (index) => GestureDetector(
                        onTap: () => controller.genderSelection(index),
                        child: Column(
                          children: [
                            Container(
                              height: 70.h,
                              width: 70.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: controller.currentGender == index
                                      ? primaryClr.withValues(alpha: 0.5)
                                      : null,
                                  border:
                                      Border.all(color: primaryClr, width: 1.w),
                                  shape: BoxShape.circle),
                              child: FaIcon(
                                controller.gender[index].iconData,
                                size: 40.sp,
                                color: const Color(0xFF854442),
                              ),
                            ),
                            Gap(8.h),
                            Text(controller.gender[index].title,
                                style: Theme.of(context).textTheme.bodyMedium)
                          ],
                        ),
                      ),
                    ),
                  );
                }),
                Gap(32.h),
                Text('selectBloodGroup'.tr,
                    style: Theme.of(context).textTheme.titleMedium),
                Gap(8.h),
                GetBuilder<RegistrationController>(builder: (controller) {
                  return Wrap(
                      children: List.generate(
                          controller.bloodGroup.length,
                          (index) => Padding(
                              padding:
                                  EdgeInsets.only(right: 20.w, bottom: 20.h),
                              child: GestureDetector(
                                onTap: () =>
                                    controller.bloodGroupSelection(index),
                                child: Container(
                                    height: 50.h,
                                    width: 50.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: controller.currentBloodGroup ==
                                                index
                                            ? primaryClr.withValues(alpha: 0.5)
                                            : null,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: primaryClr, width: 1.w)),
                                    child: Text(
                                        controller.bloodGroup[index].title.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium)),
                              ))));
                }),
                Gap(32.h),
                GetBuilder<RegistrationController>(
                    builder: (controller) => controller.isLoading
                        ? AppConstFunctions.customCircularProgressIndicator
                        : CustomElevatedButton(
                            onPressed: () {
                              _formOnSubmit(controller);
                            },
                            name: 'register'.tr)),
                Gap(32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _formOnSubmit(RegistrationController controller) async {
    if (controller.imageFile == null) {
      AppConstFunctions.customErrorMessage(message: 'Please select an image');
      return;
    }

    if (controller.formKey.currentState!.validate()) {
      final result = await controller.registerUser(
          registrationData: RegistrationModel(
            name: controller.nameController.text,
            location: controller.locationController.text,
            phone: controller.phone,
            password: controller.pinController.text,
            gender: controller.gender[controller.currentGender].value,
            bloodGroup: controller.bloodGroup[controller.currentBloodGroup].value,
          ));
      if (result) {
        Get.toNamed(AppRoutes.homeScreen);
      }
    }
  }
}

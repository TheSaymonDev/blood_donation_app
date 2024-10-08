import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_blood_donation/screens/seeker_post_screen/controllers/seeker_post_controller.dart';
import 'package:free_blood_donation/screens/seeker_post_screen/models/seeker_post_model.dart';
import 'package:free_blood_donation/utils/app_colors.dart';
import 'package:free_blood_donation/utils/app_const_functions.dart';
import 'package:free_blood_donation/utils/app_validations.dart';
import 'package:free_blood_donation/widgets/custom_app_bar.dart';
import 'package:free_blood_donation/widgets/custom_elevated_button.dart';
import 'package:free_blood_donation/widgets/custom_text_form_field.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SeekerPostScreen extends StatelessWidget {
  SeekerPostScreen({super.key});

  final _donationRequestController = Get.find<SeekerPostController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onPressed: () {}, title: 'drAppbarTitle'.tr),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(16.h),
                Text('drSelectBloodGroup'.tr,
                    style: Theme.of(context).textTheme.titleMedium),
                Gap(8.h),
                GetBuilder<SeekerPostController>(builder: (controller) {
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
                Gap(16.h),
                CustomTextFormField(
                    hintText: 'drLocationLabel'.tr,
                    controller: _donationRequestController.locationController,
                    validator: AppValidators.locationValidator,
                    prefixIcon: Icon(Icons.location_on_outlined, size: 25.sp)),
                Gap(16.h),
                CustomTextFormField(
                  hintText: 'drDescriptionLabel'.tr,
                  controller: _donationRequestController.desController,
                  maxLines: 3,
                  validator: AppValidators.desValidator,
                ),
                Gap(16.h),
                GetBuilder<SeekerPostController>(builder: (controller) {
                  return controller.imageFile != null
                      ? Container(
                          height: 300.h,
                          width: double.infinity.w,
                          alignment: Alignment.topRight,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: primaryClr,
                              image: DecorationImage(
                                  image: FileImage(controller.imageFile!),
                                  fit: BoxFit.cover)),
                          child: Container(
                            height: 50.h,
                            width: 50.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.r),
                                  topRight: Radius.circular(8.r)),
                              color: primaryClr,
                            ),
                            child: IconButton(
                              onPressed: () => controller.clearImage(),
                              icon: Icon(
                                Icons.close,
                                size: 25.sp,
                                color: lightBgClr,
                              ),
                            ),
                          ))
                      : CustomTextFormField(
                          onTap: () {
                            controller.getImageFromGallery();
                          },
                          hintText: 'drAddPhotoLabel'.tr,
                          prefixIcon: Icon(Icons.camera_alt, size: 20.sp),
                          controller:
                              _donationRequestController.photoController,
                          readOnly: true,
                        );
                }),
                Gap(16.h),
                Text('drCauseTitle'.tr,
                    style: Theme.of(context).textTheme.titleMedium),
                Gap(8.h),
                GetBuilder<SeekerPostController>(builder: (controller) {
                  return Wrap(
                      children: List.generate(
                          controller.cause.length,
                          (index) => Padding(
                              padding:
                                  EdgeInsets.only(right: 20.w, bottom: 20.h),
                              child: GestureDetector(
                                onTap: () => controller.causeSelection(index),
                                child: Container(
                                    height: 40.h,
                                    width: 112.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: controller.currentCause == index
                                            ? primaryClr.withValues(alpha: 0.5)
                                            : null,
                                        border: Border.all(
                                            color: primaryClr, width: 1.w)),
                                    child: Text(controller.cause[index].tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium)),
                              ))));
                }),
                Gap(16.h),
                GetBuilder<SeekerPostController>(builder: (controller) {
                  return CustomTextFormField(
                    hintText: 'drDateTimeLabel'.tr,
                    onTap: () async {
                      await _selectDateTime(
                          context); // Opens date and time pickers
                    },
                    readOnly: true,
                    controller: _donationRequestController.dateTimeController,
                    validator: AppValidators.dateTimeValidator,
                    prefixIcon: Icon(Icons.calendar_month, size: 20.sp),
                  );
                }),
                Gap(16.h),
                Text('drUnitTitle'.tr,
                    style: Theme.of(context).textTheme.titleMedium),
                GetBuilder<SeekerPostController>(builder: (controller) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline, size: 30.sp),
                        onPressed: controller.decrementUnit,
                        color: primaryClr,
                      ),
                      Container(
                        width: 40.w,
                        height: 40.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: primaryClr, width: 1.w),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          controller.unit
                              .toString(), // Display the current unit
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline, size: 30.sp),
                        onPressed: controller.incrementUnit,
                        color: primaryClr,
                      ),
                    ],
                  );
                }),
                Gap(16.h),
                GetBuilder<SeekerPostController>(
                    builder: (controller) => controller.isLoading
                        ? AppConstFunctions.customCircularProgressIndicator
                        : CustomElevatedButton(
                            onPressed: () {
                              _formOnSubmit(controller, context);
                            },
                            name: 'drRequestBtn'.tr)),
                Gap(32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to pick both date and time
  Future<void> _selectDateTime(BuildContext context) async {
    // First, pick the date
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // Then, pick the time
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        // Combine picked date and time into a single DateTime object
        final DateTime finalDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        _donationRequestController.setSelectedDateTime(finalDateTime);
      }
    }
  }

  void _formOnSubmit(
      SeekerPostController controller, BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final result = await controller.createSeekerPost(
          seekerPostData: SeekerPostModel(
              bloodGroup:
                  controller.bloodGroup[controller.currentBloodGroup].value,
              location: controller.locationController.text,
              description: controller.desController.text,
              cause: controller.cause[controller.currentCause],
              dateTime: controller.dateTimeController.text,
              unit: controller.unit.toString()));
      if (result) {
        Navigator.pop(context);
      }
    }
  }
}

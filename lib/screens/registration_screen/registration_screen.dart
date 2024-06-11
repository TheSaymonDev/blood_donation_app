import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:free_blood_donation/routes/app_routes.dart';
import 'package:free_blood_donation/screens/registration_screen/models/blood_group.dart';
import 'package:free_blood_donation/screens/registration_screen/models/gender.dart';
import 'package:free_blood_donation/utils/app_colors.dart';
import 'package:free_blood_donation/widgets/custom_app_bar.dart';
import 'package:free_blood_donation/widgets/custom_background.dart';
import 'package:free_blood_donation/widgets/custom_elevated_button.dart';
import 'package:free_blood_donation/widgets/custom_text_form_field.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();

  final List<Gender> _gender = [
    Gender(title: 'male', iconData: FontAwesomeIcons.person, value: 'male'),
    Gender(
        title: 'female',
        iconData: FontAwesomeIcons.personDress,
        value: 'female'),
  ];
  int _selectedGender = 0;

  final List<BloodGroup> _bloodGroup = [
    BloodGroup(title: 'aPositive', value: 'a positive'),
    BloodGroup(title: 'aNegative', value: 'a negative'),
    BloodGroup(title: 'bPositive', value: 'b positive'),
    BloodGroup(title: 'bNegative', value: 'b negative'),
    BloodGroup(title: 'oPositive', value: 'o positive'),
    BloodGroup(title: 'oNegative', value: 'o negative'),
    BloodGroup(title: 'abPositive', value: 'ab positive'),
    BloodGroup(title: 'abNegative', value: 'ab negative'),
  ];
  int _selectedBloodGroup = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
          onPressed: () {
            Get.back();
          },
          title: 'registrationAppbar'.tr),
      body: CustomBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(120.h),
                Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                        onTap: () {},
                        child: Stack(
                          children: [
                            SizedBox(
                                height: 110.h,
                                width: 110.w,
                                child: CircleAvatar(
                                    backgroundColor: primaryClr.withOpacity(0.8),
                                    child: FaIcon(FontAwesomeIcons.userLarge,
                                        color: lightBgClr, size: 55.sp))),
                            Positioned(
                                top: 4,
                                right: 4,
                                child: CircleAvatar(
                                    radius: 17.r,
                                    backgroundColor: primaryClr,
                                    child: Icon(Icons.camera_alt,
                                        color: lightBgClr, size: 17.sp)))
                          ],
                        ))),
                Gap(32.h),
                CustomTextFormField(
                    hintText: 'fullName'.tr, controller: _nameController),
                Gap(16.h),
                CustomTextFormField(
                    hintText: 'location'.tr,
                    controller: _locationController,
                    prefixIcon: Icon(Icons.location_on_outlined,
                        size: 25.sp)),
                Gap(32.h),
                Text('selectGender'.tr, style: Theme.of(context).textTheme.titleMedium),
                Gap(8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    _gender.length,
                    (index) => GestureDetector(
                      onTap: () {
                        _selectedGender = index;
                        setState(() {});
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 70.h,
                            width: 70.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: _selectedGender == index
                                    ? primaryClr.withOpacity(0.5)
                                    : null,
                                border: Border.all(color: primaryClr, width: 1.w),
                                shape: BoxShape.circle),
                            child: FaIcon(
                              _gender[index].iconData,
                              size: 40.sp,
                              color: const Color(0xFF854442),
                            ),
                          ),
                          Gap(8.h),
                          Text(_gender[index].title.tr,
                              style: Theme.of(context).textTheme.bodyMedium)
                        ],
                      ),
                    ),
                  ),
                ),
                Gap(32.h),
                Text('selectBloodGroup'.tr, style: Theme.of(context).textTheme.titleMedium),
                Gap(8.h),
                Wrap(
                    children: List.generate(
                        _bloodGroup.length,
                        (index) => Padding(
                            padding: EdgeInsets.only(right: 20.w, bottom: 20.h),
                            child: GestureDetector(
                              onTap: () {
                                _selectedBloodGroup = index;
                                setState(() {});
                              },
                              child: Container(
                                  height: 50.h,
                                  width: 50.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: _selectedBloodGroup == index
                                          ? primaryClr.withOpacity(0.5)
                                          : null,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: primaryClr,
                                          width: 1.w)),
                                  child: Text(_bloodGroup[index].title.tr,
                                      style: Theme.of(context).textTheme.bodyMedium)),
                            )))),
                Gap(32.h),
                CustomElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.homeScreen);
                    },
                    name: 'register'.tr)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

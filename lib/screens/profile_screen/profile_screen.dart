import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:free_blood_donation/localizations/language_controller.dart';
import 'package:free_blood_donation/routes/app_routes.dart';
import 'package:free_blood_donation/screens/profile_screen/controllers/current_user_controller.dart';
import 'package:free_blood_donation/screens/profile_screen/controllers/donation_status_controller.dart';
import 'package:free_blood_donation/screens/profile_screen/models/clickable_item.dart';
import 'package:free_blood_donation/screens/profile_screen/models/current_user_model.dart';
import 'package:free_blood_donation/screens/profile_screen/models/donation_status_model.dart';
import 'package:free_blood_donation/services/shared_preference_service.dart';
import 'package:free_blood_donation/themes/theme_controller.dart';
import 'package:free_blood_donation/utils/app_colors.dart';
import 'package:free_blood_donation/utils/app_urls.dart';
import 'package:free_blood_donation/widgets/custom_card.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final List<ClickableItem> _clickableItems = [
    ClickableItem(
      iconData: Icons.bloodtype_rounded,
      title: 'nearbyDonor',
      cardColor: const Color(0xFFFDEDEC),
      onTap: () {
        Get.toNamed(AppRoutes.nearbyDonorScreen);
      },
    ),
    ClickableItem(
      iconData: FontAwesomeIcons.peopleGroup,
      title: 'donorGroup',
      cardColor: const Color(0xFFF5EEF8),
      onTap: () {
        Get.toNamed(AppRoutes.donorGroupScreen);
      },
    ),
    ClickableItem(
      iconData: FontAwesomeIcons.personCirclePlus,
      title: 'inviteFriends',
      cardColor: const Color(0xFFEAF2F8),
      onTap: () {},
    ),
    ClickableItem(
      iconData: FontAwesomeIcons.buildingShield,
      title: 'privacyPolicy',
      cardColor: const Color(0xFFFBEEE6),
      onTap: () {
        Get.toNamed(AppRoutes.privacyPolicyScreen);
      },
    ),
    ClickableItem(
      iconData: FontAwesomeIcons.starHalfStroke,
      title: 'rateUs',
      cardColor: const Color(0xFFE8F6F3),
      onTap: () {},
    ),
    ClickableItem(
      iconData: FontAwesomeIcons.info,
      title: 'aboutUs',
      cardColor: const Color(0xFFFEF9E7),
      onTap: () {
        Get.toNamed(AppRoutes.aboutUsScreen);
      },
    ),
    ClickableItem(
      iconData: FontAwesomeIcons.rightFromBracket,
      title: 'logout',
      cardColor: const Color(0xFFEBEDEF),
      onTap: () {
        SharedPreferencesService().clearUserData();
        Get.offAllNamed(AppRoutes.onboardingScreen);
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity.h,
      width: double.infinity.w,
      padding: EdgeInsets.only(top: 12.h, left: 16.w, right: 16.w),
      child: Column(
        children: [
          _buildProfileCard(context),
          Gap(8.h),
          _buildSettingsRow(context),
          Gap(8.h),
          _buildClickableItems(context),
        ],
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return GetBuilder<CurrentUserController>(builder: (controller) {
      final profileData = controller.currentUserData!.data;
      return Stack(
        children: [
          CustomCard(
            height: 160.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Column(
                children: [
                  _buildProfileDetails(context, profileData!),
                  _buildProfileStats(context, profileData),
                ],
              ),
            ),
          ),
          Positioned(
            right: -12,
            top: -12,
            child: IconButton(
              color: Colors.red,
              onPressed: () {
                Get.toNamed(AppRoutes.profileUpdateScreen,
                    arguments: {'profileData': profileData});
              },
              icon: FaIcon(FontAwesomeIcons.squarePen, size: 30.sp),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildProfileDetails(BuildContext context, ProfileData profileData) {
    return Expanded(
      child: Row(
        children: [
          SizedBox(
            height: 90.h,
            width: 90.w,
            child: profileData.photo != null
                ? CircleAvatar(
                    backgroundImage:
                        NetworkImage('${AppUrls.imgUrl}${profileData.photo}'),
                  )
                : CircleAvatar(
                    backgroundColor: primaryClr.withValues(alpha: 0.8),
                    child: FaIcon(
                      FontAwesomeIcons.userLarge,
                      color: lightBgClr,
                      size: 55.sp,
                    ),
                  ),
          ),
          Gap(16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${profileData.name}'.toUpperCase(),
                    style: Theme.of(context).textTheme.titleLarge),
                Gap(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8.w,
                      children: [
                        FaIcon(FontAwesomeIcons.locationCrosshairs,
                            size: 18.sp),
                        Text('${profileData.location}'.toUpperCase(),
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8.w,
                      children: [
                        FaIcon(FontAwesomeIcons.handHoldingDroplet,
                            size: 18.sp),
                        Text('2', style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStats(BuildContext context, ProfileData profileData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildProfileStatItem('${profileData.gender}', context),
        _buildProfileStatItem('${profileData.bloodGroup}', context),
        _buildProfileStatItem('${profileData.phone}', context),
        Column(
          children: [
            Transform.scale(
              scale: 0.7, // Adjust the scale factor to control the size
              child: GetBuilder<DonationStatusController>(
                builder: (controller) {
                  return CupertinoSwitch(
                    value: controller.status!,
                    onChanged: (newValue) => controller.changeDonationStatus(
                        donationStatusData:
                            DonationStatusModel(availableForDonate: newValue)),
                  );
                },
              ),
            ),
            Text('donateNowBtn'.tr,
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileStatItem(String text, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: primaryClr,
      ),
      child: Text(
        text.toUpperCase(),
        style:
            Theme.of(context).textTheme.titleSmall!.copyWith(color: lightBgClr),
      ),
    );
  }

  Widget _buildSettingsRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GetBuilder<LanguageController>(builder: (controller) {
            return CustomCard(
              height: 100.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.language, size: 30.sp),
                      Gap(12.h),
                      Text('language'.tr,
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  CupertinoSwitch(
                      value: controller.isEnglish,
                      onChanged: (newValue) => controller.changeLanguage()),
                ],
              ),
            );
          }),
        ),
        Expanded(
          child: GetBuilder<ThemeController>(
            builder: (controller) {
              return CustomCard(
                height: 100.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          controller.isDark
                              ? AppUrls.moonJson
                              : AppUrls.sunJson,
                          width: 50.h,
                        ),
                        Gap(12.h),
                        Text(
                          controller.isDark ? 'night'.tr : 'day'.tr,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    CupertinoSwitch(
                      value: controller.isDark,
                      onChanged: (newValue) => controller.changeTheme(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildClickableItems(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: List.generate(
        _clickableItems.length,
        (index) => InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: _clickableItems[index].onTap,
          child: CustomCard(
            height: 125.h,
            width: 115.w,
            cardClr: _clickableItems[index].cardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FaIcon(_clickableItems[index].iconData,
                    size: 25.sp, color: darkBgClr),
                Gap(8.h),
                Text(_clickableItems[index].title.tr,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: darkBgClr),
                    textAlign: TextAlign.center)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

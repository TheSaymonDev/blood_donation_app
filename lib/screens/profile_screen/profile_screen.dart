import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:free_blood_donation/localizations/language_controller.dart';
import 'package:free_blood_donation/screens/profile_screen/models/clickable_item.dart';
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
      },
    ),
    ClickableItem(
      iconData: FontAwesomeIcons.peopleGroup,
      title: 'donorGroup',
      cardColor: const Color(0xFFF5EEF8),
      onTap: () {

      },
    ),
    ClickableItem(
      iconData: FontAwesomeIcons.personCirclePlus,
      title: 'inviteFriends',
      cardColor: const Color(0xFFEAF2F8),
      onTap: () {

      },
    ),
    ClickableItem(
      iconData: FontAwesomeIcons.buildingShield,
      title: 'privacyPolicy',
      cardColor: const Color(0xFFFBEEE6),
      onTap: () {

      },
    ),
    ClickableItem(
      iconData: FontAwesomeIcons.starHalfStroke,
      title: 'rateUs',
      cardColor: const Color(0xFFE8F6F3),
      onTap: () {

      },
    ),
    ClickableItem(
      iconData: FontAwesomeIcons.info,
      title: 'aboutUs',
      cardColor: const Color(0xFFFEF9E7),
      onTap: () {

      },
    ),
    ClickableItem(
      iconData: FontAwesomeIcons.rightFromBracket,
      title: 'logout',
      cardColor: const Color(0xFFEBEDEF),
      onTap: () {

      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity.h,
      width: double.infinity.w,
      padding: EdgeInsets.only(top: 90.h, left: 16.w, right: 16.w),
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
    return Stack(
      children: [
        CustomCard(
          height: 180.h,
          child: Padding(
            padding: EdgeInsets.only(bottom: 12.h, left: 8.w),
            child: Column(
              children: [
                _buildProfileDetails(context),
                _buildProfileStats(context),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            onPressed: () {
              // Handle edit profile
            },
            icon: FaIcon(FontAwesomeIcons.squarePen, size: 25.sp),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileDetails(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          SizedBox(
            height: 90.h,
            width: 90.w,
            child: CircleAvatar(
              backgroundColor: primaryClr.withOpacity(0.8),
              child: FaIcon(
                FontAwesomeIcons.userLarge,
                color: lightBgClr,
                size: 55.sp,
              ),
            ),
          ),
          Gap(16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('MD. SAYMON', style: Theme.of(context).textTheme.titleLarge),
              Gap(4.h),
              Row(
                children: [
                  Text('Gollamari, Khulana\nBangladesh',
                      style: Theme.of(context).textTheme.bodyMedium),
                  Gap(32.w),
                  Column(
                    children: [
                      Row(
                        children: [
                          FaIcon(FontAwesomeIcons.handHoldingDroplet,
                              size: 20.sp),
                          Gap(8.w),
                          Text('2', style: Theme.of(context).textTheme.titleLarge),
                        ],
                      ),
                      Text('donations'.tr, style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStats(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildProfileStatItem('Male', context),
        _buildProfileStatItem('B+', context),
        _buildProfileStatItem('01643831739', context),
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
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: lightBgClr),
      ),
    );
  }

  Widget _buildSettingsRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GetBuilder<LanguageController>(
            builder: (controller) {
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
                        Text('language'.tr, style: Theme.of(context).textTheme.titleMedium),
                      ],
                    ),
                    CupertinoSwitch(value: controller.isEnglish, onChanged: (newValue)=> controller.changeLanguage()),
                  ],
                ),
              );
            }
          ),
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
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(color: darkBgClr),
                    textAlign: TextAlign.center)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_blood_donation/utils/app_colors.dart';
import 'package:free_blood_donation/utils/app_urls.dart';
import 'package:free_blood_donation/widgets/custom_app_bar.dart';
import 'package:free_blood_donation/widgets/custom_background.dart';
import 'package:free_blood_donation/widgets/custom_elevated_button.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class BloodSeekerDetailsScreen extends StatelessWidget {
  const BloodSeekerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
          onPressed: () {
            Get.back();
          },
          title: 'Blood Request For B+'),
      body: CustomBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 40.h,
                  width: 40.w,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryClr,
                  ),
                  child: Text('B+',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: darkFontClr))),
              Gap(16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('M', style: Theme.of(context).textTheme.bodyMedium),
                      Text('Gender',
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  Column(
                    children: [
                      Text('1', style: Theme.of(context).textTheme.bodyMedium),
                      Text('Unit',
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  Column(
                    children: [
                      Text('4', style: Theme.of(context).textTheme.bodyMedium),
                      Text('Accepts',
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ],
              ),
              Gap(8.h),
              Row(
                children: [
                  Icon(Icons.access_time_filled,
                      size: 18.sp, color: primaryClr),
                  Gap(8.w),
                  Text('06 Sep, 2024  10:52 PM',
                      style: Theme.of(context).textTheme.bodySmall)
                ],
              ),
              Gap(4.h),
              Row(
                children: [
                  Icon(Icons.location_on, size: 20.sp, color: primaryClr),
                  Gap(8.w),
                  Text('Gollamari, Khulna, Bangladesh',
                      style: Theme.of(context).textTheme.bodySmall)
                ],
              ),
              Gap(32.h),
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    backgroundImage: const AssetImage(AppUrls.demoPhoto),
                  ),
                  Gap(8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('MD. SAYMON',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                      Row(
                        children: [
                          Text('An hour ago',
                              style: Theme.of(context).textTheme.bodySmall),
                          Gap(8.w),
                          Text('Gollamari, Khulna',
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Gap(8.h),
              Text(
                  'Lorem ipsum dolor sit amet consectetur. In cras dolor elit elit. Risus nulla donec nam mauris posuere faucibus dictum. Mattis.',
                  style: Theme.of(context).textTheme.bodyMedium),
              Gap(8.h),
              Container(
                height: 220.h,
                width: double.infinity.w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppUrls.demoPhoto),
                        fit: BoxFit.cover)),
              ),
              Gap(32.h),
              CustomElevatedButton(onPressed: () {}, name: 'Accept'),
              Gap(16.h),
              CustomElevatedButton(onPressed: () {}, name: 'Share'),
            ],
          ),
        ),
      ),
    );
  }
}

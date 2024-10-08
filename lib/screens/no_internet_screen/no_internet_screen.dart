import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_blood_donation/screens/no_internet_screen/controllers/connection_controller.dart';
import 'package:free_blood_donation/utils/app_colors.dart';
import 'package:free_blood_donation/utils/app_const_functions.dart';
import 'package:free_blood_donation/widgets/custom_elevated_button.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 200.w,
                height: 200.h,
                child: Lottie.asset('assets/lotties/no_internet.json')),
            Gap(32.h),
            Text(
              'Whoops!',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 35.sp, color: primaryClr),
            ),
            Gap(16.h),
            Text(
              'No internet connection found\nPlease check your internet settings',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            Gap(32.h),
            GetBuilder<ConnectionController>(
                builder: (controller) => controller.isLoading
                    ? AppConstFunctions.customCircularProgressIndicator
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: CustomElevatedButton(
                            onPressed: () {
                              controller.checkConnection();
                            },
                            name: 'Refresh'),
                      ))
          ],
        ),
      ),
    );
  }
}
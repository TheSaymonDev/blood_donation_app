import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_blood_donation/screens/request_screen/controllers/my_request_controller.dart';
import 'package:free_blood_donation/utils/app_colors.dart';
import 'package:free_blood_donation/utils/app_const_functions.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class MyRequestWidget extends StatelessWidget {
  const MyRequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyRequestController>(
        builder: (controller) => controller.isLoading
            ? AppConstFunctions.customCircularProgressIndicator
            : controller.myRequestData!.data!.isEmpty
                ? Center(
                    child: Text('No data found',
                        style: Theme.of(context).textTheme.titleMedium),
                  )
                : ListView.separated(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    itemBuilder: (context, index) {
                      final myRequestData =
                          controller.myRequestData!.data![index];
                      return Row(
                        children: [
                          Container(
                            height: 60.h,
                            width: 60.w,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: primaryClr),
                            child: Text(myRequestData.bloodGroup!.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: darkFontClr)),
                          ),
                          Gap(16.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(myRequestData.location!,
                                  style: Theme.of(context).textTheme.bodyLarge),
                              Text('6 Days ago',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              Text(myRequestData.cause!.toUpperCase(),
                                  style: Theme.of(context).textTheme.bodySmall),
                              Gap(16.h),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 4.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                        color: Colors.red),
                                    child: Text('0 Accepted',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(color: darkFontClr)),
                                  ),
                                  Gap(32.w),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 4.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.r),
                                        color: Colors.blue),
                                    child: Text('0 Donated',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(color: darkFontClr)),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                          thickness: 0.5,
                        ),
                    itemCount: controller.myRequestData!.data!.length));
  }
}

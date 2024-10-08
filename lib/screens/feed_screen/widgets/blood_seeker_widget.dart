import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_blood_donation/routes/app_routes.dart';
import 'package:free_blood_donation/screens/feed_screen/controllers/blood_seeker_controller.dart';
import 'package:free_blood_donation/screens/feed_screen/models/blood_seeker_model.dart';
import 'package:free_blood_donation/utils/app_const_functions.dart';
import 'package:free_blood_donation/utils/app_urls.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class BloodSeekerWidget extends StatelessWidget {
  const BloodSeekerWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<BloodSeekerController>(
        builder: (controller) => controller.isLoading
            ? AppConstFunctions.customCircularProgressIndicator
            : controller.bloodSeekerData!.data!.isEmpty
                ? Center(
                    child: Text('No data found',
                        style: Theme.of(context).textTheme.titleMedium),
                  )
                : ListView.separated(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    itemBuilder: (context, index){
                      final bloodSeekerData = controller.bloodSeekerData!.data![index];
                      return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                              child: _buildUserInfoRow(bloodSeekerData, context),
                            ),
                            Gap(8.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Text(bloodSeekerData.description!,
                                  style: Theme.of(context).textTheme.bodyMedium),
                            ),
                            Gap(8.h),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.bloodSeekerDetailsScreen);
                              },
                              child: Container(
                                height: 220.h,
                                width: double.infinity.w,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage('${AppUrls.imgUrl}${bloodSeekerData.photo}'),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            _buildActionButtonsRow(bloodSeekerData, context)
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Gap(8),
                    itemCount: controller.bloodSeekerData!.data!.length));
  }

  Row _buildActionButtonsRow(BloodSeekerData bloodSeekerData, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton.icon(
          onPressed: () {},
          label: Text('${bloodSeekerData.likesCount} Like',
              style: Theme.of(context).textTheme.bodyMedium),
          icon: Icon(Icons.thumb_up_outlined, size: 25.sp),
        ),
        TextButton.icon(
          onPressed: () {},
          label: Text('Views', style: Theme.of(context).textTheme.bodyMedium),
          icon: Icon(Icons.visibility, size: 25.sp),
        ),
        TextButton.icon(
          onPressed: () {},
          label: Text('Share', style: Theme.of(context).textTheme.bodyMedium),
          icon: Icon(Icons.share, size: 25.sp),
        )
      ],
    );
  }

  Row _buildUserInfoRow(BloodSeekerData bloodSeekerData, BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundImage: NetworkImage('${AppUrls.imgUrl}${bloodSeekerData.user!.photo}'),
        ),
        Gap(8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(bloodSeekerData.user!.name!.toUpperCase(),
                    style: Theme.of(context).textTheme.titleMedium),
                Gap(8.w),
                Text('Looking for ${bloodSeekerData.bloodGroup}',
                    style: Theme.of(context).textTheme.titleSmall)
              ],
            ),
            Row(
              children: [
                Text('1 hour ago',
                    style: Theme.of(context).textTheme.bodySmall),
                Gap(8.w),
                Text(bloodSeekerData.location!,
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            )
          ],
        )
      ],
    );
  }
}

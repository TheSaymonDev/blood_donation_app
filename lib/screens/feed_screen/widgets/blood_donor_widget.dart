import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_blood_donation/screens/feed_screen/models/blood_seeker.dart';
import 'package:free_blood_donation/utils/app_urls.dart';
import 'package:gap/gap.dart';

class BloodDonorWidget extends StatelessWidget {
  BloodDonorWidget({super.key});

  final List<BloodDonor> _bloodSeekers = [
    BloodDonor(
        userPhoto: AppUrls.demoPhoto,
        userName: 'Md.Saymon',
        bloodGroup: 'B+',
        time: '1 hour ago',
        location: 'Gollamari, Khulna',
        description:
        'Lorem ipsum dolor sit amet consectetur. In cras dolor elit elit. Risus nulla donec nam mauris posuere faucibus dictum. Mattis.',
        imgUrl: AppUrls.demoPhoto,
        acceptedCount: '1',
        donatedCount: '0',
        likeCount: '0'),
    BloodDonor(
        userPhoto: AppUrls.demoPhoto,
        userName: 'Md.Saymon',
        bloodGroup: 'B+',
        time: '1 hour ago',
        location: 'Gollamari, Khulna',
        description:
        'Lorem ipsum dolor sit amet consectetur. In cras dolor elit elit. Risus nulla donec nam mauris posuere faucibus dictum. Mattis.',
        imgUrl: AppUrls.demoPhoto,
        acceptedCount: '1',
        donatedCount: '0',
        likeCount: '0'),
    BloodDonor(
        userPhoto: AppUrls.demoPhoto,
        userName: 'Md.Saymon',
        bloodGroup: 'B+',
        time: '1 hour ago',
        location: 'Gollamari, Khulna',
        description:
        'Lorem ipsum dolor sit amet consectetur. In cras dolor elit elit. Risus nulla donec nam mauris posuere faucibus dictum. Mattis.',
        imgUrl: AppUrls.demoPhoto,
        acceptedCount: '1',
        donatedCount: '0',
        likeCount: '0'),
    BloodDonor(
        userPhoto: AppUrls.demoPhoto,
        userName: 'Md.Saymon',
        bloodGroup: 'B+',
        time: '1 hour ago',
        location: 'Gollamari, Khulna',
        description:
        'Lorem ipsum dolor sit amet consectetur. In cras dolor elit elit. Risus nulla donec nam mauris posuere faucibus dictum. Mattis.',
        imgUrl: AppUrls.demoPhoto,
        acceptedCount: '1',
        donatedCount: '0',
        likeCount: '0'),
    BloodDonor(
        userPhoto: AppUrls.demoPhoto,
        userName: 'Md.Saymon',
        bloodGroup: 'B+',
        time: '1 hour ago',
        location: 'Gollamari, Khulna',
        description:
        'Lorem ipsum dolor sit amet consectetur. In cras dolor elit elit. Risus nulla donec nam mauris posuere faucibus dictum. Mattis.',
        imgUrl: AppUrls.demoPhoto,
        acceptedCount: '1',
        donatedCount: '0',
        likeCount: '0'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        itemBuilder: (context, index) => Column(
          children: [
            _buildUserInfoRow(index, context),
            Gap(8.h),
            Text(_bloodSeekers[index].description,
                style: Theme.of(context).textTheme.bodyMedium),
            Gap(8.h),
            Container(
              height: 220.h,
              width: double.infinity.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(_bloodSeekers[index].imgUrl),
                      fit: BoxFit.cover)),
            ),
            _buildActionButtonsRow(index, context)
          ],
        ),
        separatorBuilder: (context, index) => const Gap(8),
        itemCount: _bloodSeekers.length);
  }

  Row _buildActionButtonsRow(int index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton.icon(
          onPressed: () {},
          label: Text('${_bloodSeekers[index].likeCount} Like',
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

  Row _buildUserInfoRow(int index, BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundImage: AssetImage(_bloodSeekers[index].userPhoto),
        ),
        Gap(8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(_bloodSeekers[index].userName,
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            Row(
              children: [
                Text(_bloodSeekers[index].time,
                    style: Theme.of(context).textTheme.bodySmall),
                Gap(8.w),
                Text(_bloodSeekers[index].location,
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            )
          ],
        )
      ],
    );
  }
}

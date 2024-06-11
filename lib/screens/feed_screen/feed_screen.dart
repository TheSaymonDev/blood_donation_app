import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_blood_donation/screens/feed_screen/widgets/blood_donor.dart';
import 'package:free_blood_donation/screens/feed_screen/widgets/blood_seeker.dart';
import 'package:free_blood_donation/utils/app_colors.dart';
import 'package:get/get.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity.h,
      width: double.infinity.w,
      padding: EdgeInsets.only(top: 90.h, left: 16.w, right: 16.w),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Get.theme.colorScheme.primary.withOpacity(0.8)),
            child: TabBar(
              controller: _tabController,
              labelStyle: Get.textTheme.titleMedium,
              unselectedLabelStyle: Get.textTheme.bodyMedium,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: primaryClr,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: primaryClr, width: 2.w)),
              dividerColor: Colors.transparent,
              indicatorWeight: 2.w,
              tabs: const [
                Tab(
                  text: 'bloodSeeker',
                ),
                Tab(
                  text: 'bloodDonor',
                )
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: const [BloodSeeker(), BloodDonor()],
            ),
          ),
        ],
      ),
    );
  }
}

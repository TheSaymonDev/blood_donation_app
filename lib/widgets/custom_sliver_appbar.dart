import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_blood_donation/utils/app_colors.dart';
import 'package:get/get.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  final TabController tabController;
  final List<Tab> tabs;
  final VoidCallback onLeadingPressed;

  const CustomSliverAppBar({
    super.key,
    required this.title,
    required this.tabController,
    required this.tabs,
    required this.onLeadingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: primaryClr,
      leading: IconButton(
        onPressed: onLeadingPressed,
        icon: Icon(Icons.arrow_back, size: 25.sp, color: lightBgClr),
      ),
      title: Text(
        title.tr,
        style: Get.textTheme.titleMedium!.copyWith(color: lightBgClr),
      ),
      pinned: true,
      floating: true,
      snap: true,
      toolbarHeight: 60.h,
      bottom: TabBar(
        controller: tabController,
        labelStyle: Get.textTheme.titleMedium!.copyWith(color: darkFontClr),
        unselectedLabelStyle: Get.textTheme.bodyMedium!.copyWith(color: darkFontClr),
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: lightBgClr,
        dividerColor: Colors.transparent,
        indicatorWeight: 4.w,
        tabs: tabs,
      ),
    );
  }
}

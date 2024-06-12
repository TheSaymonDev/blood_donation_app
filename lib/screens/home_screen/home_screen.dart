import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:free_blood_donation/screens/feed_screen/feed_screen.dart';
import 'package:free_blood_donation/screens/history_screen/history_screen.dart';
import 'package:free_blood_donation/screens/home_screen/controllers/bottom_nav_controller.dart';
import 'package:free_blood_donation/screens/profile_screen/profile_screen.dart';
import 'package:free_blood_donation/screens/request_screen/request_screen.dart';
import 'package:free_blood_donation/utils/app_colors.dart';
import 'package:free_blood_donation/widgets/custom_app_bar.dart';
import 'package:free_blood_donation/widgets/custom_background.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final _screens = [
    const FeedScreen(),
    const RequestScreen(),
    const HistoryScreen(),
    ProfileScreen()
  ];

  static final List<String> _titles = [
    'newsFeed',
    'bloodRequest',
    'history',
    'profile'
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(builder: (controller) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          mini: true,
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: NavigationBar(
          height: 92.h,
          elevation: 5,
          onDestinationSelected: controller.changeScreen,
          selectedIndex: controller.selectedIndex,
          destinations: [
            _buildNavigationDestination(
                iconData: FontAwesomeIcons.newspaper, label: 'nav1'),
            Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: _buildNavigationDestination(
                    iconData: FontAwesomeIcons.codePullRequest,
                    label: 'nav2')),
            Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: _buildNavigationDestination(
                    iconData: FontAwesomeIcons.clockRotateLeft,
                    label: 'nav3')),
            _buildNavigationDestination(
                iconData: FontAwesomeIcons.userTie, label: 'nav4')
          ],
        ),
        // appBar: CustomAppBar(
        //     onPressed: () {}, title: _titles[controller.selectedIndex].tr),
        body: CustomBackground(
            child: _screens.elementAt(controller.selectedIndex)),
      );
    });
  }

  NavigationDestination _buildNavigationDestination({
    required IconData iconData,
    required String label,
  }) {
    return NavigationDestination(
      icon: FaIcon(iconData, size: 20.sp),
      selectedIcon: FaIcon(iconData, color: primaryClr, size: 25.sp),
      label: label.tr,
    );
  }
}

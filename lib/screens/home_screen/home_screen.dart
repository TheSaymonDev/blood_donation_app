import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:free_blood_donation/screens/feed_screen/feed_screen.dart';
import 'package:free_blood_donation/screens/history_screen/history_screen.dart';
import 'package:free_blood_donation/screens/home_screen/controllers/bottom_nav_controller.dart';
import 'package:free_blood_donation/screens/profile_screen/profile_screen.dart';
import 'package:free_blood_donation/screens/request_screen/request_screen.dart';
import 'package:free_blood_donation/utils/app_colors.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Widget> _screenList = [
    FeedScreen(),
    const RequestScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home Screen'),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            foregroundColor: redColor,
            backgroundColor: whiteClr,
            mini: true,
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: NavigationBar(
            backgroundColor: Get.theme.colorScheme.primary,
            indicatorColor: redColor.withOpacity(0.2),
            shadowColor: Get.theme.colorScheme.onPrimary,
            elevation: 5,
            onDestinationSelected: controller.changeScreen,
            selectedIndex: controller.selectedIndex,
            destinations: const [
              NavigationDestination(
                icon: FaIcon(FontAwesomeIcons.newspaper),
                selectedIcon: FaIcon(FontAwesomeIcons.newspaper, color: redColor),
                label: 'Feed',
              ),
              NavigationDestination(
                icon: FaIcon(FontAwesomeIcons.codePullRequest),
                selectedIcon: FaIcon(FontAwesomeIcons.codePullRequest, color: redColor),
                label: 'Request',
              ),
              NavigationDestination(
                icon: FaIcon(FontAwesomeIcons.clockRotateLeft),
                selectedIcon: FaIcon(FontAwesomeIcons.clockRotateLeft, color: redColor),
                label: 'History',
              ),
              NavigationDestination(
                icon: FaIcon(FontAwesomeIcons.userTie),
                selectedIcon: FaIcon(FontAwesomeIcons.userTie, color: redColor),
                label: 'Profile',
              ),
            ],
          ),
          body: _screenList.elementAt(controller.selectedIndex),
        );
      }
    );
  }
}

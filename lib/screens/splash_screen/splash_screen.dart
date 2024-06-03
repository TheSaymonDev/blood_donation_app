import 'package:flutter/material.dart';
import 'package:free_blood_donation/screens/splash_screen/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>().moveToHomeScreen();
    return Scaffold(
      appBar: AppBar(
        title: Text('Splash Screen'),
      ),
    );
  }
}

import 'dart:async';
import 'package:free_blood_donation/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  void moveToHomeScreen() {
    Timer.periodic(
      const Duration(seconds: 3),
      (timer) => Get.toNamed(AppRoutes.onboardingScreen),
    );
  }
}

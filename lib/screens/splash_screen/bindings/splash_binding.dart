import 'package:free_blood_donation/screens/splash_screen/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut(() => SplashController());
  }
}
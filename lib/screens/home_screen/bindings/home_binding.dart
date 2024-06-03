import 'package:free_blood_donation/screens/home_screen/controllers/bottom_nav_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController(),);
  }
}
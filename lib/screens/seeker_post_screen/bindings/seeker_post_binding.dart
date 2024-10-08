import 'package:free_blood_donation/screens/seeker_post_screen/controllers/seeker_post_controller.dart';
import 'package:get/get.dart';

class SeekerPostBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SeekerPostController());
  }
}
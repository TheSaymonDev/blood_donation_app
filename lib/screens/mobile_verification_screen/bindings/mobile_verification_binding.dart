import 'package:free_blood_donation/screens/mobile_verification_screen/controller/find_user_controller.dart';
import 'package:get/get.dart';

class MobileVerificationBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FindUserController());
  }
}
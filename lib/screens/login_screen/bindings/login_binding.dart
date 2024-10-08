import 'package:free_blood_donation/screens/login_screen/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => LoginController());
  }
}
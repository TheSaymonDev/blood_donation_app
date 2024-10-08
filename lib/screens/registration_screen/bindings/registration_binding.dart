import 'package:free_blood_donation/screens/registration_screen/controllers/registration_controller.dart';
import 'package:get/get.dart';

class RegistrationBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => RegistrationController());
  }
}
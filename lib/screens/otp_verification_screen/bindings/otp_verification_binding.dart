import 'package:free_blood_donation/screens/otp_verification_screen/controllers/otp_controller.dart';
import 'package:get/get.dart';

class OtpVerificationBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => OtpVerificationController());
  }

}
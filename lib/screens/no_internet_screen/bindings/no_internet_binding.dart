import 'package:free_blood_donation/screens/no_internet_screen/controllers/connection_controller.dart';
import 'package:get/get.dart';

class NoInternetBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ConnectionController());
  }
}
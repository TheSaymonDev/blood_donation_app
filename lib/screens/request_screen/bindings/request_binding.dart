import 'package:free_blood_donation/screens/request_screen/controllers/my_request_controller.dart';
import 'package:get/get.dart';

class RequestBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(MyRequestController());
  }
}
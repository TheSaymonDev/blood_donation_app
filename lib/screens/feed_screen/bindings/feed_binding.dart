import 'package:free_blood_donation/screens/feed_screen/controllers/blood_seeker_controller.dart';
import 'package:get/get.dart';

class FeedBinding implements Bindings{
  @override
  void dependencies() {
   Get.put(BloodSeekerController());
  }
}
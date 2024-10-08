import 'package:free_blood_donation/screens/profile_screen/controllers/current_user_controller.dart';
import 'package:free_blood_donation/screens/profile_screen/controllers/donation_status_controller.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() async{
    // Initialize CurrentUserController first
    final currentUserController = Get.put(CurrentUserController());

    // Wait for the getCurrentUser() function to complete before proceeding
    await currentUserController.getCurrentUser();

    // After currentUserController has finished loading, initialize DonationStatusController
    Get.put(DonationStatusController());
  }
}

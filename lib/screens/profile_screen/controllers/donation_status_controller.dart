import 'package:free_blood_donation/screens/profile_screen/controllers/current_user_controller.dart';
import 'package:free_blood_donation/screens/profile_screen/models/donation_status_model.dart';
import 'package:get/get.dart';
import 'package:free_blood_donation/services/api_service.dart';
import 'package:free_blood_donation/utils/app_const_functions.dart';
import 'package:free_blood_donation/utils/app_urls.dart';

class DonationStatusController extends GetxController {
  bool? status;

  Future<void> changeDonationStatus(
      {required DonationStatusModel donationStatusData}) async {
    try {
      final response = await ApiService().patch(
          url: AppUrls.changeDonationStatusUrl,
          headers: AppUrls.getHeaderWithToken,
          data: donationStatusData);
      if (response.success) {
        status = !status!;
        AppConstFunctions.customSuccessMessage(
            message: 'Donation Status Updated');
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'Donation Status Update Failed';
        AppConstFunctions.customErrorMessage(message: errorMessage);
      }
    } catch (error) {
      AppConstFunctions.customErrorMessage(message: error.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    status = Get.find<CurrentUserController>().currentUserData!.data!.availableForDonate;
  }
}

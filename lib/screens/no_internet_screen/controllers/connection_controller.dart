import 'package:free_blood_donation/routes/app_routes.dart';
import 'package:free_blood_donation/services/connectivity_service.dart';
import 'package:free_blood_donation/services/shared_preference_service.dart';
import 'package:free_blood_donation/utils/app_const_functions.dart';
import 'package:get/get.dart';

class ConnectionController extends GetxController {
  bool isLoading = false;

  Future<void> checkConnection() async {
    _setLoading(true);
    final bool hasInternet = await ConnectivityService.isConnected();
    if (hasInternet) {
      final token = SharedPreferencesService().getToken();
      if(token.isNotEmpty){
        Get.offAllNamed(AppRoutes.homeScreen);
      }else{
        Get.offAllNamed(AppRoutes.onboardingScreen);
      }
      _setLoading(false);
    } else {
      AppConstFunctions.customErrorMessage(
          message: 'Still no internet connection. Please try again.');
      _setLoading(false);
    }
  }
  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}

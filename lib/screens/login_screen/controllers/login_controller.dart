import 'package:free_blood_donation/screens/login_screen/models/login_model.dart';
import 'package:free_blood_donation/services/api_service.dart';
import 'package:free_blood_donation/services/shared_preference_service.dart';
import 'package:free_blood_donation/utils/app_const_functions.dart';
import 'package:free_blood_donation/utils/app_urls.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  bool isLoading = false;

  Future<bool> loginUser({required LoginModel loginData}) async {
    _setLoading(true);
    try {
      final response = await ApiService()
          .post(url: AppUrls.loginUrl, data: loginData);
      if (response.success) {
        SharedPreferencesService().saveUserData(response.data);
        AppConstFunctions.customSuccessMessage(message: 'Login Success');
        _setLoading(false);
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Login Failed';
        AppConstFunctions.customErrorMessage(message: errorMessage);
        _setLoading(false);
        return false;
      }
    } catch (error) {
      AppConstFunctions.customErrorMessage(message: error.toString());
      _setLoading(false);
      return false;
    }
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}

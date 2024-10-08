import 'package:free_blood_donation/screens/request_screen/models/my_request_model.dart';
import 'package:free_blood_donation/services/api_service.dart';
import 'package:free_blood_donation/utils/app_const_functions.dart';
import 'package:free_blood_donation/utils/app_urls.dart';
import 'package:get/get.dart';

class MyRequestController extends GetxController {
  bool isLoading = false;
  MyRequestModel? myRequestData;
  Future<void> getAllMyRequest() async {
    _setLoading(true);
    try {
      final response = await ApiService().get(url: AppUrls.getAllMyRequestUrl, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        myRequestData = MyRequestModel.fromJson(response.data);
        _setLoading(false);
      } else {
        final errorMessage =
            response.message['message'] ?? 'Get My Request Failed';
        AppConstFunctions.customErrorMessage(message: errorMessage);
        _setLoading(false);
      }
    } catch (error) {
      AppConstFunctions.customErrorMessage(message: error.toString());
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getAllMyRequest();
  }
}

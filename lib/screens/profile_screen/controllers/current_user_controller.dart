import 'package:free_blood_donation/screens/profile_screen/models/current_user_model.dart';
import 'package:free_blood_donation/services/api_service.dart';
import 'package:free_blood_donation/utils/app_const_functions.dart';
import 'package:free_blood_donation/utils/app_urls.dart';
import 'package:get/get.dart';

class CurrentUserController extends GetxController{
  bool isLoading = false;
  CurrentUserModel? currentUserData;
  Future<void> getCurrentUser() async{
    _setLoading(true);
    try{
      final response = await ApiService().get(url: AppUrls.getCurrentUserUrl, headers: AppUrls.getHeaderWithToken);
      if(response.success){
        currentUserData = CurrentUserModel.fromJson(response.data);
        _setLoading(false);
      }else{
        final errorMessage =
            response.message['message'] ?? 'Get Current User Request Failed';
        AppConstFunctions.customErrorMessage(message: errorMessage);
        _setLoading(false);
      }
    }catch(error){
      AppConstFunctions.customErrorMessage(message: error.toString());
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }

}
import 'package:free_blood_donation/screens/feed_screen/models/blood_seeker_model.dart';
import 'package:free_blood_donation/services/api_service.dart';
import 'package:free_blood_donation/utils/app_const_functions.dart';
import 'package:free_blood_donation/utils/app_urls.dart';
import 'package:get/get.dart';

class BloodSeekerController extends GetxController{
  bool isLoading = false;
  BloodSeekerModel? bloodSeekerData;
  Future<void> getAllSeekerPost() async{
    _setLoading(true);
    try{
      final response = await ApiService().get(url: AppUrls.getAllSeekerPostUrl);
      if(response.success){
        bloodSeekerData = BloodSeekerModel.fromJson(response.data);
        _setLoading(false);
      }else{
        final errorMessage =
            response.message['message'] ?? 'Get Blood Seeking Post Failed';
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

  @override
  void onInit() {
    super.onInit();
    getAllSeekerPost();
  }

}
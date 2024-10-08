import 'package:free_blood_donation/services/shared_preference_service.dart';

class AppUrls{
  static const screen1Png = 'assets/images/case.png';
  static const screen2Png = 'assets/images/donation.png';
  static const screen3Png = 'assets/images/track.png';

  static const otpPng = 'assets/images/otp.png';
  static const moonJson = 'assets/lotties/moon.json';
  static const sunJson = 'assets/lotties/sun.json';

  static const demoPhoto = 'assets/images/demo_photo.png';

  //for api url
  static const _baseUrl = "https://api.blood-donation.finaltry-innovations.site/api/v1";
  static const Map<String, String> requestHeader = {"Content-Type": "application/json"};
  static Map<String, String> get getHeaderWithToken{
    String token = SharedPreferencesService().getToken();
    return  {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
  }
  static const imgUrl = 'https://api.blood-donation.finaltry-innovations.site';

  static const findUserUrl = '$_baseUrl/user/find-user';
  static const loginUrl = '$_baseUrl/user/login';
  static const registerUrl = '$_baseUrl/user/register';
  static const verifyOtpUrl = '$_baseUrl/user/verify-otp';
  static const getCurrentUserUrl = '$_baseUrl/user/get-user';
  static const updateProfileUrl = '$_baseUrl/user/update-user';
  static const changeDonationStatusUrl = '$_baseUrl/user/change-donation-status';
  static const createSeekerPostUrl = '$_baseUrl/blood-seeking/create-post';
  static const getAllSeekerPostUrl = '$_baseUrl/blood-seeking/get-all-posts';
  static const getAllMyRequestUrl = '$_baseUrl/blood-seeking/get-all-my-posts';

}
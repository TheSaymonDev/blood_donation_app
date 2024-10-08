import 'package:flutter/material.dart';
import 'package:free_blood_donation/screens/otp_verification_screen/models/otp_model.dart';
import 'package:free_blood_donation/services/api_service.dart';
import 'package:free_blood_donation/utils/app_const_functions.dart';
import 'package:free_blood_donation/utils/app_urls.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  bool isLoading = false;
  final otpController = TextEditingController();
  final focusNode = FocusNode();
  late String phone;

  Future<bool> verifyOtp({required OtpModel otpData}) async {
    _setLoading(true);
    try {
      final response = await ApiService()
          .post(url: AppUrls.verifyOtpUrl, data: otpData);
      if (response.success) {
        AppConstFunctions.customSuccessMessage(message: 'OTP Verified');
        _setLoading(false);
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Otp Verification Failed';
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

  @override
  void onInit() {
    super.onInit();
    phone = Get.arguments['phone'] as String;
  }

  @override
  void dispose() {
    otpController.dispose();
    focusNode.dispose();
    super.dispose();
  }

}

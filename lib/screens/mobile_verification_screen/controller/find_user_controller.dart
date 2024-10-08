import 'package:flutter/material.dart';
import 'package:free_blood_donation/screens/mobile_verification_screen/models/find_user_model.dart';
import 'package:free_blood_donation/services/api_service.dart';
import 'package:free_blood_donation/utils/app_const_functions.dart';
import 'package:free_blood_donation/utils/app_urls.dart';
import 'package:get/get.dart';

class FindUserController extends GetxController {
  bool isLoading = false;
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<String> findUser({required FindUserModel findUserData}) async {
    _setLoading(true);
    try {
      final response = await ApiService().post(url: AppUrls.findUserUrl, data: findUserData);
      _setLoading(false);
      if (response.success) {
        final message = response.data['message'];
        return message;
      } else {
        final errorMessage = response.message['message'] ?? 'Log In Failed';
        AppConstFunctions.customErrorMessage(message: 'Something went wrong');
        return errorMessage;
      }
    } catch (error) {
      _setLoading(false);
      AppConstFunctions.customErrorMessage(message: error.toString());
      return error.toString();
    }
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}

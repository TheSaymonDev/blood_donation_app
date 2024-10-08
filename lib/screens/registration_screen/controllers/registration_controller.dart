import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:free_blood_donation/screens/registration_screen/models/blood_group.dart';
import 'package:free_blood_donation/screens/registration_screen/models/gender.dart';
import 'package:free_blood_donation/screens/registration_screen/models/registration_model.dart';
import 'package:free_blood_donation/services/api_service.dart';
import 'package:free_blood_donation/services/shared_preference_service.dart';
import 'package:free_blood_donation/utils/app_const_functions.dart';
import 'package:free_blood_donation/utils/app_urls.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationController extends GetxController {

  File? imageFile;
  bool isLoading = false;
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final pinController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late String phone;

  final List<Gender> gender = [
    Gender(title: 'male'.tr, iconData: FontAwesomeIcons.person, value: 'male'),
    Gender(
        title: 'female'.tr,
        iconData: FontAwesomeIcons.personDress,
        value: 'female'),
  ];
  int currentGender = 0;
  void genderSelection(int index) {
    currentGender = index;
    update();
  }

  final List<BloodGroup> bloodGroup = [
    BloodGroup(title: 'aPositive', value: 'a+'),
    BloodGroup(title: 'aNegative', value: 'a-'),
    BloodGroup(title: 'bPositive', value: 'b+'),
    BloodGroup(title: 'bNegative', value: 'b-'),
    BloodGroup(title: 'oPositive', value: 'o+'),
    BloodGroup(title: 'oNegative', value: 'o-'),
    BloodGroup(title: 'abPositive', value: 'ab+'),
    BloodGroup(title: 'abNegative', value: 'ab-'),
  ];
  int currentBloodGroup = 0;
  void bloodGroupSelection(int index) {
    currentBloodGroup = index;
    update();
  }

  Future<bool> registerUser(
      {required RegistrationModel registrationData}) async {
    _setLoading(true);
    Map<String, String> formData = {
      'name': registrationData.name!,
      'phone': registrationData.phone!,
      'password': registrationData.password!,
      'location': registrationData.location!,
      'gender': registrationData.gender!,
      'bloodGroup': registrationData.bloodGroup!,
    };
    try {
      final response = await ApiService().postMultipart(
          url: AppUrls.registerUrl, data: formData, file: imageFile!);
      if (response.success) {
        SharedPreferencesService().saveUserData(response.data);
        AppConstFunctions.customSuccessMessage(message: 'Registration Success');
        _setLoading(false);
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Registration Failed';
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

  Future<void> getImageFromGallery() async {
    try {
      final pickedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        imageFile = File(pickedImage.path);
      } else {
        AppConstFunctions.customErrorMessage(message: 'No image selected.');
      }
      update();
    } catch (error) {
      AppConstFunctions.customErrorMessage(message: 'Failed to pick image.');
    }
  }

  @override
  void onInit() {
    super.onInit();
    phone = Get.arguments['phone'] as String;
  }
}

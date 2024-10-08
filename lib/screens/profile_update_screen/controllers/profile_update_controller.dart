import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:free_blood_donation/screens/profile_screen/controllers/current_user_controller.dart';
import 'package:free_blood_donation/screens/profile_screen/models/current_user_model.dart';
import 'package:free_blood_donation/screens/profile_update_screen/models/profile_update_model.dart';
import 'package:free_blood_donation/screens/registration_screen/models/blood_group.dart';
import 'package:free_blood_donation/screens/registration_screen/models/gender.dart';
import 'package:free_blood_donation/services/api_service.dart';
import 'package:free_blood_donation/services/connectivity_service.dart';
import 'package:free_blood_donation/utils/app_const_functions.dart';
import 'package:free_blood_donation/utils/app_urls.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdateController extends GetxController {
  File? imageFile;
  bool isLoading = false;
  late ProfileData profileData;
  final nameController = TextEditingController();
  final locationController = TextEditingController();

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

  Future<void> updateProfile(
      {required ProfileUpdateModel profileUpdateData}) async {
    if (!await ConnectivityService.isConnected()) {
      AppConstFunctions.customErrorMessage(
          message: 'Please check your internet connection');
      return;
    }
    _setLoading(true);
    Map<String, String> formData = {
      'name': profileUpdateData.name!,
      'location': profileUpdateData.location!,
      'gender': profileUpdateData.gender!,
      'bloodGroup': profileUpdateData.bloodGroup!,
    };
    try {
      final response = await ApiService().patchMultipart(
          url: AppUrls.updateProfileUrl,
          headers: AppUrls.getHeaderWithToken,
          data: formData,
          file: imageFile);
      if (response.success) {
        AppConstFunctions.customSuccessMessage(
            message: 'Profile Update Success');
        Get.find<CurrentUserController>().getCurrentUser();
      } else {
        final errorMessage =
            response.message['message'] ?? 'Profile Update Failed';
        AppConstFunctions.customErrorMessage(message: errorMessage);
      }
    } catch (error) {
      AppConstFunctions.customErrorMessage(message: error.toString());
    } finally {
      _setLoading(false);
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
    profileData = Get.arguments['profileData'] as ProfileData;
    nameController.text = profileData.name ?? '';
    locationController.text = profileData.location ?? '';
    // Assign gender based on profile data
    currentGender = gender.indexWhere((g) => g.value == profileData.gender);
    if (currentGender == -1) {
      currentGender = 0; // Default to the first gender if not found
    }
    // Assign blood group based on profile data
    currentBloodGroup =
        bloodGroup.indexWhere((b) => b.value == profileData.bloodGroup);
    if (currentBloodGroup == -1) {
      currentBloodGroup = 0; // Default to the first blood group if not found
    }
    update();
  }
}

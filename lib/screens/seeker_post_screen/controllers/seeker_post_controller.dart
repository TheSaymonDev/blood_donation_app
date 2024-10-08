import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:free_blood_donation/screens/registration_screen/models/blood_group.dart';
import 'package:free_blood_donation/screens/seeker_post_screen/models/seeker_post_model.dart';
import 'package:free_blood_donation/services/api_service.dart';
import 'package:free_blood_donation/utils/app_const_functions.dart';
import 'package:free_blood_donation/utils/app_urls.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class SeekerPostController extends GetxController {
  File? imageFile;
  bool isLoading = false;

  final locationController = TextEditingController();
  final desController = TextEditingController();
  final photoController = TextEditingController();

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

  final List<String> cause = ['dengue', 'accident', 'caesar', 'thalassemia'];
  int currentCause = 0;
  void causeSelection(int index) {
    currentCause = index;
    update();
  }

  Future<bool> createSeekerPost(
      {required SeekerPostModel seekerPostData}) async {
    _setLoading(true);
    Map<String, String> formData = {
      'bloodGroup': seekerPostData.bloodGroup!,
      'location': seekerPostData.location!,
      'description': seekerPostData.description!,
      'cause': seekerPostData.cause!,
      'dateTime': seekerPostData.dateTime!,
      'unit': seekerPostData.unit!,
    };
    try {
      final response = await ApiService().postMultipart(
          url: AppUrls.createSeekerPostUrl, data: formData, file: imageFile!, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        AppConstFunctions.customSuccessMessage(
            message: 'Donation Request Success');
        _setLoading(false);
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Donation Request Failed';
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

  void clearImage() {
    imageFile = null;
    update();
  }

  DateTime? selectedDateTime;
  final dateTimeController = TextEditingController();

  void setSelectedDateTime(DateTime dateTime) {
    selectedDateTime = dateTime;
    dateTimeController.text =
        DateFormat('dd/MM/yyyy hh:mm a').format(selectedDateTime!);
    update();
  }

  int unit = 1; // Default unit
  void incrementUnit() {
    if (unit < 10) {
      // Set a max unit limit if needed
      unit++;
      update(); // Update the UI
    }
  }

  void decrementUnit() {
    if (unit > 1) {
      // Prevent the unit from going below 1
      unit--;
      update(); // Update the UI
    }
  }
}

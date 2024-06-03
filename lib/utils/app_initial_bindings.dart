import 'package:free_blood_donation/localizations/language_controller.dart';
import 'package:free_blood_donation/themes/theme_controller.dart';
import 'package:get/get.dart';

class AppInitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(LanguageController());
  }
}

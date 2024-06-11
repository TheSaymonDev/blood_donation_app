import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_blood_donation/localizations/app_localization.dart';
import 'package:free_blood_donation/routes/app_pages.dart';
import 'package:free_blood_donation/routes/app_routes.dart';
import 'package:free_blood_donation/themes/app_theme.dart';
import 'package:free_blood_donation/utils/app_initial_bindings.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(430, 932),
      builder: (_, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: AppLocalization(),
        fallbackLocale: const Locale('en', 'US'),
        initialRoute: AppRoutes.onboardingScreen,
        getPages: AppPages.pages,
        initialBinding: AppInitialBindings(),
        theme: lightTheme,
        darkTheme: darkTheme,
      ),
    );
  }
}
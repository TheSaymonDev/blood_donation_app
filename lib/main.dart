import 'package:flutter/material.dart';
import 'package:free_blood_donation/app.dart';
import 'package:free_blood_donation/routes/app_routes.dart';
import 'package:free_blood_donation/services/connectivity_service.dart';
import 'package:free_blood_donation/services/shared_preference_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService().init();

  final token = SharedPreferencesService().getToken();

  final bool hasInternet = await ConnectivityService.isConnected();

  runApp(
    MyApp(
      initialRoute: hasInternet
          ? (token.isNotEmpty
              ? AppRoutes.homeScreen
              : AppRoutes.onboardingScreen)
          : AppRoutes.noInternetScreen,
    ),
  );
}

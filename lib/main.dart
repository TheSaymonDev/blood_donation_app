import 'package:flutter/material.dart';
import 'package:free_blood_donation/app.dart';
import 'package:free_blood_donation/services/shared_preference_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService().init();
  runApp(const MyApp());
}
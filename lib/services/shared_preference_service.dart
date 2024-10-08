import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService{
  static final SharedPreferencesService _instance = SharedPreferencesService._internal();
  factory SharedPreferencesService() => _instance;
  SharedPreferencesService._internal();
  late SharedPreferences _prefs;
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void saveUserData(Map<String, dynamic> userData) {
    _prefs.setString('token', userData['data']['accessToken'] ?? '');
  }

  String getToken() {
    return _prefs.getString('token') ?? '';
  }

  void clearUserData() {
    _prefs.remove('token');
  }

  void saveTheme(String theme) {
    _prefs.setString('themeKey', theme);
  }
  String getTheme() {
    return _prefs.getString('themeKey') ?? '';
  }

  void saveLanguage(String language) {
    _prefs.setString('languageKey', language);
  }
  String getLanguage() {
    return _prefs.getString('languageKey') ?? '';
  }
}
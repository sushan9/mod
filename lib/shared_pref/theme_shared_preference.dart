import 'package:shared_preferences/shared_preferences.dart';

class ThemeSharedPreference {
  Future loadDarkPref() async {
    SharedPreferences sharedPreference = await SharedPreferences.getInstance();
    bool darkPref = sharedPreference.getBool('isDark') ?? false;
  }

  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('isDark', value);
  }
}

import 'package:first/shared_pref/theme_shared_preference.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider(this._isDarkMode) {
    themeSharedPreference = ThemeSharedPreference();
  }

  late bool _isDarkMode;
  late ThemeSharedPreference themeSharedPreference;

  bool get isDarkMode => _isDarkMode;

  void toggle(bool isDark) {
    _isDarkMode = isDark;
    notifyListeners();
    themeSharedPreference.setTheme(isDark);
  }
}

class MyThemes {
  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.grey.shade900,
  );
  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
  );
}

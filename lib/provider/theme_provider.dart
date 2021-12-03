import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool _isDarkMode = true;
  bool get isDarkMode => _isDarkMode;

  void toggle(bool isDark) {
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    _isDarkMode = isDark;
    notifyListeners();
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

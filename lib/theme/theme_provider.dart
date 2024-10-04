import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/dark_theme.dart';
import 'package:flutter_application_1/theme/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode ;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set(ThemeData themeData) {
    _themeData = themeData ;
    notifyListeners();
  }

  void toggleTheme() {
    if (themeData == lightMode) {
      _themeData = darkMode;
    } else {
      _themeData = lightMode;
    }
    notifyListeners();
  }
}
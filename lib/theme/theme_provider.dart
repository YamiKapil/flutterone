import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool isDarkMode = false;

  bool get DarkTheme => isDarkMode;

  setTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}

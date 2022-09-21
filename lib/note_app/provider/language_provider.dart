import 'package:flutter/material.dart';

class AppLanguageProvider extends ChangeNotifier {
  Locale _appLocale = Locale('en');

  Locale get language => _appLocale;

  changeLanguage(String _language) {
    _appLocale = Locale(_language);
    notifyListeners();
  }
}

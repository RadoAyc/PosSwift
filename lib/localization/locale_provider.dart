import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale;

  LocaleProvider();

  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.supportedLocales.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null; // Set to null to use device locale
    notifyListeners();
  }
}

class L10n {
  static const supportedLocales = [
    Locale('en'),
    Locale('es'), // Add Spanish locale as an example
    Locale('ar'), // Add Arabic locale for RTL testing
  ];
}

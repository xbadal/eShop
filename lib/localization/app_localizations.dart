import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'application.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations({this.locale});

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" Syntax

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // Static Member for the simple access of AppLocalizationsDelegate From MaterialApp
//  static const LocalizationsDelegate<AppLocalizations> delegate =
//      _AppLocalizationsDelegate();

  static var _localizedStrings = {};

  static Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appTranslations = AppLocalizations(locale: locale);
    String jsonContent =
        await rootBundle.loadString("assets/i18n/${locale.languageCode}.json");

    final jsonMap = jsonDecode(jsonContent);
    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
    return appTranslations;
  }

  // This is method is called from every widget which needs Localised text
  String translate(String key) {
    return _localizedStrings[key];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  final Locale newLocale;

  const AppLocalizationsDelegate({this.newLocale});

  @override
  bool isSupported(Locale locale) {
    return application.supportedLanguagesCodes.contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    return AppLocalizations.load(newLocale ?? locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => true;
}

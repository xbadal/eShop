import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:sample_provider_app/localization/app_localizations.dart';
import 'package:sample_provider_app/localization/application.dart';
import 'package:sample_provider_app/locator.dart';
import 'package:sample_provider_app/services/storage/storage_service.dart';

class BaseViewModel extends ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  bool _mounted = false;

  bool get mounted => _mounted;

  void setBusy(bool value) {
    _loading = value;
    notifyListeners();
  }

  final prefs = locator<StorageService>();

  AppLocalizationsDelegate _delegate;

  initDelegate() {
    _delegate = AppLocalizationsDelegate(
        newLocale:
            prefs.fetchLocale != null ? Locale(prefs.fetchLocale) : null);
    application.onLocaleChanged = _changeLanguage;
  }

  Locale _appLocale;

  AppLocalizationsDelegate get delegate => _delegate;

  String get languageName => prefs.fetchLocale;

  Language get currentLanguage {
    if (languageName == "en") {
      return Language(
        name: "English",
        code: "en",
        flag: "assets/images/english.png",
      );
    }

    if (languageName == "es") {
      return Language(
        name: "Espanol",
        code: "es",
        flag: "assets/images/espanol.png",
      );
    }
    return null;
  }

  void _changeLanguage(Locale type) async {
    if (_appLocale == type) {
      return;
    }
    if (type == Locale("es")) {
      _appLocale = Locale("es");
      await prefs.saveLocale('es');
    } else {
      _appLocale = Locale("en");
      await prefs.saveLocale('en');
    }
    _delegate = AppLocalizationsDelegate(newLocale: _appLocale);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _mounted = true;
  }
}

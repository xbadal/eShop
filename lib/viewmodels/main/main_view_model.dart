import 'dart:ui';

import 'package:sample_provider_app/localization/application.dart';
import 'package:sample_provider_app/viewmodels/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

class MainViewModel extends BaseViewModel {
  final _changeLanguageController = BehaviorSubject<Language>();

  Stream<Language> get language => _changeLanguageController.stream;

  Function(Language) get onLanguageChange => _changeLanguageController.sink.add;

  void onChangeLanguage() {
    Language lang = _changeLanguageController.value;
    if (lang != null) {
      application.onLocaleChanged(Locale(lang.code));
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _changeLanguageController?.close();
    super.dispose();
  }
}

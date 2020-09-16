import 'dart:ui';

class Application {
  static final Application _application = Application._internal();

  factory Application() {
    return _application;
  }

  Application._internal();

  final List<String> supportedLanguages = ["English"];

  final List<Language> languages = [
    Language(name: "English", code: "en", flag: "assets/images/english.png")
  ];

  final List<String> supportedLanguagesCodes = ["en"];

  //returns the list of supported Locales
  Iterable<Locale> supportedLocales() =>
      supportedLanguagesCodes.map<Locale>((language) => Locale(language, ""));

  //function to be invoked when changing the language
  LocaleChangeCallback onLocaleChanged;
}

Application application = Application();

typedef void LocaleChangeCallback(Locale locale);

class Language {
  final String name;
  final String code;
  final String flag;

  Language({this.name, this.code, this.flag});
}

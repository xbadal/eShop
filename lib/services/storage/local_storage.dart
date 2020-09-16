import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sample_provider_app/constants/key_provider.dart';
import 'package:sample_provider_app/models/auth/user.dart';
import 'package:sample_provider_app/services/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends StorageService {
  final SharedPreferences prefs;

  LocalStorage({@required this.prefs}) : assert(prefs != null);

  @override
  String get authToken => prefs.getString(AUTH_TOKEN) ?? "";

  @override
  String get userType => prefs.getString(LOGIN_TYPE) ?? "";

  @override
  String get pushToken => prefs.getString(PUSH_TOKEN) ?? "";

  @override
  String get fetchLocale => "en";

  @override
  Future<bool> saveAuthToken(String value) {
    return prefs.setString(AUTH_TOKEN, value);
  }

  @override
  Future<bool> savePushToken(String value) {
    return prefs.setString(PUSH_TOKEN, value);
  }

  @override
  Future<bool> saveLocale(String value) {
    return prefs.setString(APP_LOCALE, value);
  }

  @override
  Future<bool> clearAll() {
    return prefs.clear();
  }

  @override
  Future<bool> saveUser(User user) {
    final value = jsonEncode(user);
    return prefs.setString(USER_DATA, value);
  }

  @override
  User get userData {
    if (!prefs.containsKey(USER_DATA)) {
      return null;
    }
    final userString = prefs.getString(USER_DATA);
    return User.fromJson(jsonDecode(userString));
  }

  @override
  Future<bool> saveUserType(String value) {
    return prefs.setString(AUTH_TOKEN, value);
  }
}

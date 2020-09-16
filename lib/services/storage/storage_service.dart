import 'package:sample_provider_app/models/auth/user.dart';

abstract class StorageService {
  String get authToken;

  String get pushToken;

  String get fetchLocale;

  User get userData;

  Future<bool> saveUser(User user);

  Future<bool> savePushToken(String value);

  Future<bool> saveAuthToken(String value);

  Future<bool> saveLocale(String value);

  Future<bool> clearAll();
}

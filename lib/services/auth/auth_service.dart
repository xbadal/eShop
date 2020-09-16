import 'package:flutter/cupertino.dart';
import 'package:sample_provider_app/constants/routes_name.dart';
import 'package:sample_provider_app/models/auth/auth_response_model.dart';
import 'package:sample_provider_app/models/auth/user.dart';
import 'package:sample_provider_app/services/common/common_base_service.dart';

class AuthenticationService extends BaseService {
  bool get hasToken =>
      storageService.authToken != null && storageService.authToken.isNotEmpty;

  String get authToken => storageService.authToken;

  String get pushToken => storageService.pushToken;

  bool get isLoggedIn => hasToken;

  Future<bool> saveUser(User user) {
    return storageService.saveUser(user);
  }

  Future<bool> saveAuthToken(String value) {
    return storageService.saveAuthToken(value);
  }

  Future<AuthResponseModel> loginUser(Map data) {
    return repository.loginUser(data);
  }

  Future<dynamic> navigateToLogin() {
    return navigationService.navigateUntilRemoved(LoginRoutePage);
  }

  Future<dynamic> navigateToHome() {
    return navigationService.navigateUntilRemoved(HomeRoutePage);
  }

  Future<dynamic> containerForSheet<T>(
      {BuildContext context, Widget child}) async {
    return await showCupertinoModalPopup<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      return value;
    });
  }
}

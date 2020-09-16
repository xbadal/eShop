import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigatorKey;

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigatorKey.currentState
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateUntilRemoved(String routeName, {dynamic arguments}) {
    return _navigatorKey.currentState.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  void pop() {
    _navigatorKey.currentState.pop();
  }

  void popWithData(dynamic data) {
    _navigatorKey.currentState.pop(data);
  }
}

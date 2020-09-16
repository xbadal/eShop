import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_provider_app/constants/routes_name.dart';
import 'package:sample_provider_app/ui/views/home/home_view.dart';
import 'package:sample_provider_app/ui/views/intro/intro_view.dart';
import 'package:sample_provider_app/ui/views/login/login_view.dart';
import 'package:sample_provider_app/ui/widgets/error_widget_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case IntroRoutePage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: IntroView(),
      );
    case LoginRoutePage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );

    case HomeRoutePage:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );

    default:
      return CupertinoPageRoute(
        builder: (_) => ErrorWidgetView(
          icon: "assets/images/error.png",
          title: '',
          message: '',
          showButton: false,
        ),
      );
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return CupertinoPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}

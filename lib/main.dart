import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logger/logger.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:sample_provider_app/localization/application.dart';
import 'package:sample_provider_app/localization/localization_keys.dart';
import 'package:sample_provider_app/locator.dart';
import 'package:sample_provider_app/router/router.dart';
import 'package:sample_provider_app/services/common/dialog_service.dart';
import 'package:sample_provider_app/services/common/navigation_service.dart';
import 'package:sample_provider_app/ui/shared/base_view.dart';
import 'package:sample_provider_app/ui/views/splash/splash_view.dart';

import 'localization/app_localizations.dart';
import 'viewmodels/main/main_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  Logger.level = Level.verbose;
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<MainViewModel>.withConsumer(
      viewModelBuilder: () => MainViewModel(),
      onModelReady: (model) => model.initDelegate(),
      builder: (context, model, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorObservers: [
//              FirebaseAnalyticsObserver(analytics: analytics)
          ],
          localizationsDelegates: [
            model.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: application.supportedLocales(),
          builder: (context, child) => Navigator(
            key: locator<DialogService>().navigatorKey,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => BaseView(child: child),
            ),
          ),
          navigatorKey: locator<NavigationService>().navigationKey,
          home: SplashView(),
          onGenerateRoute: generateRoute,
          onGenerateTitle: (context) =>
              AppLocalizations.of(context).translate(AppNameTitle),
        );
      },
    );
  }
}

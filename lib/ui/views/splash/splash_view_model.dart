import 'package:package_info/package_info.dart';
import 'package:sample_provider_app/locator.dart';
import 'package:sample_provider_app/log.dart';
import 'package:sample_provider_app/services/auth/auth_service.dart';
import 'package:sample_provider_app/services/repository/repository_service.dart';
import 'package:sample_provider_app/services/storage/storage_service.dart';
import 'package:sample_provider_app/viewmodels/base/base_view_model.dart';

class SplashViewModel extends BaseViewModel {
  final _service = AuthenticationService();
  final log = getLogger("SplashViewModel");
  final _repository = locator<RepositoryService>();
  final _storage = locator<StorageService>();
  bool updateAvailble = false;
  String currentVersion = '';
  String versionName;

  void handleStartupLogin() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    currentVersion = packageInfo.version;

    Future.delayed(Duration(milliseconds: 2000), () async {
      if (_service.user != null) {
        _service.navigateToHome();
      } else
        _service.navigateToLogin();
    });
  }
}

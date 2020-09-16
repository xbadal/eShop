import 'package:get_it/get_it.dart';
import 'package:sample_provider_app/services/storage/local_storage.dart';
import 'package:sample_provider_app/networking/dio_injector.dart';
import 'package:sample_provider_app/services/common/dialog_service.dart';
import 'package:sample_provider_app/services/common/navigation_service.dart';
import 'package:sample_provider_app/services/repository/api_repository.dart';
import 'package:sample_provider_app/services/repository/repository_service.dart';
import 'package:sample_provider_app/services/storage/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;
//FirebaseAnalytics analytics = FirebaseAnalytics();

Future<void> setUpLocator() async {
  final prefs = await SharedPreferences.getInstance();
  locator
      .registerLazySingleton<StorageService>(() => LocalStorage(prefs: prefs));
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<DialogService>(() => DialogService());
  injector.init();
  locator.registerLazySingleton<RepositoryService>(
      () => ApiRepository(dio: injector.dio));
}

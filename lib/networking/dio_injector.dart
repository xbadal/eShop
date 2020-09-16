import 'package:dio/dio.dart';
import 'package:sample_provider_app/constants/url_provider.dart';
import 'package:sample_provider_app/constants/url_provider.dart';
import 'package:sample_provider_app/locator.dart';
import 'package:sample_provider_app/log.dart';
import 'package:sample_provider_app/services/storage/storage_service.dart';

final DioInjector injector = DioInjector();

class DioInjector {
  static final _singleton = DioInjector._internal();
  final storage = locator<StorageService>();
  final log = getLogger("DioInjector");

  factory DioInjector() {
    return _singleton;
  }

  DioInjector._internal();

  Dio _dio;

  Dio get dio => _dio;

  init() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 20000,
      receiveTimeout: 20000,
      sendTimeout: 20000,
    ));

    _dio.interceptors
      ..add(
        InterceptorsWrapper(onRequest: (options) {
          final authToken = storage.authToken;
          print("authToken $authToken");
          if (options.extra["multipart"] == true) {
            options.headers = {
              "Content-Type": "multipart/form-data",
            };
          } else if (options.extra["removeHeader"] == true) {
            options.headers = {"content-type": "application/json"};
          } else {
            options.headers = {"content-type": "application/json"};
          }
          return options;
        }),
      )
      ..add(LogInterceptor(
          responseBody: true,
          requestBody: true,
          request: false,
          responseHeader: false));
  }
}

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../product/constants/network_costants.dart';
import 'auth_interceptor.dart';

@module
abstract class DioModule {
  @singleton
  Dio dio() {
    BaseOptions options = BaseOptions(
      baseUrl: NetworkConstants.BASE_URL,
      connectTimeout:
          const Duration(seconds: NetworkConstants.CONNECTION_TIMEOUT),
      receiveTimeout: const Duration(seconds: NetworkConstants.RECIEVE_TIMEOUT),
      headers: {
        "Content-Type": "application/json; charset=utf-8",
      },
    );

    final dio = Dio(BaseOptions(baseUrl: NetworkConstants.BASE_URL));
    dio.options = options;
    dio.interceptors.add(
        LogInterceptor(error: true, requestBody: true, responseBody: true));
    dio.interceptors.add(AuthInterceptor());
    return dio;
  }
}

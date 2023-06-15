// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kartal/kartal.dart';

import '../../product/di/injection.dart';
import '../../product/helpers/setup_token.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      /* Check JWT token */
      RequestOptions options,
      RequestInterceptorHandler handler) async {
    final token = await getIt.get<FlutterSecureStorage>().read(key: "token");
    if (token.isNotNullOrNoEmpty) {
      options.headers["Authorization"] = "Bearer $token";
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    /* Refresh token imp */
    if (err.response?.statusCode == 401) {
      SetupToken.refreshToken();
    }
    super.onError(err, handler);
  }
}

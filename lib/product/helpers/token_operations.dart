import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../product/auth/data/repositories/login_repository.dart';
import '../../product/di/injection.dart';
import '../../product/models/refresh/request/refresh_request.dart';
import '../../product/models/refresh/response/refresh_response.dart';
import '../auth/domain/models/request/login_request.dart';
import '../models/user/response/user_response.dart';

class TokenOperations {
  static Future<void> registerToken(UserResponse userResponse) async {
    final response = await getIt
        .get<ILoginRepository>()
        .login(LoginRequest(id: userResponse.id));

    await getIt
        .get<FlutterSecureStorage>()
        .write(key: "token", value: response?.token.toString());

    await getIt
        .get<FlutterSecureStorage>()
        .write(key: "refresh", value: response?.refresh.toString());
  }

  static Future<void> refreshToken() async {
    if (await getIt.get<FlutterSecureStorage>().containsKey(key: "refresh")) {
      final refresh =
          await getIt.get<FlutterSecureStorage>().read(key: "refresh");

      RefreshResponse? newToken = await getIt
          .get<ILoginRepository>()
          .refresh(RefreshRequest(refresh: refresh ?? ""))
          .catchError((onError) => print(onError));

      await getIt
          .get<FlutterSecureStorage>()
          .write(key: "token", value: newToken?.token.toString());
    }
  }

  static Future<void> removeTokens() async {
    await getIt.get<FlutterSecureStorage>().delete(key: "refresh");
    await getIt.get<FlutterSecureStorage>().delete(key: "token");
  }
}

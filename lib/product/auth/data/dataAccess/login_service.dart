import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import '../../../models/refresh/request/refresh_request.dart';
import '../../../models/refresh/response/refresh_response.dart';
import '../../domain/models/request/login_request.dart';
import '../../domain/models/response/login_response.dart';

part 'login_service.g.dart';

abstract class ILoginService {
  Future<LoginResponse?> login(LoginRequest loginRequest);
  Future<RefreshResponse?> refresh(RefreshRequest refreshRequest);
}

@RestApi()
@Injectable(as: ILoginService)
abstract class LoginManager implements ILoginService {
  @factoryMethod
  factory LoginManager(Dio dio) => _LoginManager(dio);

  @override
  @POST("/auth/login")
  Future<LoginResponse?> login(@Body() LoginRequest loginRequest);

  @override
  @POST("/auth/token")
  Future<RefreshResponse?> refresh(@Body() RefreshRequest refreshRequest);
}

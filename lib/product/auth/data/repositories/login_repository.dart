import 'package:injectable/injectable.dart';

import '../../../../core/error/error_extension.dart';
import '../../../../core/error/error_separator.dart';
import '../../../models/refresh/request/refresh_request.dart';
import '../../../models/refresh/response/refresh_response.dart';
import '../../domain/models/request/login_request.dart';
import '../../domain/models/response/login_response.dart';
import '../dataAccess/login_service.dart';

abstract class ILoginRepository {
  Future<LoginResponse?> login(LoginRequest loginRequest);
  Future<RefreshResponse?> refresh(RefreshRequest refreshRequest);
}

@Injectable(as: ILoginRepository)
class LoginRepository implements ILoginRepository {
  final ILoginService _loginService;
  final ErrorSeparator _errorSeparator;

  LoginRepository(this._loginService, this._errorSeparator);

  @override
  Future<LoginResponse?> login(LoginRequest loginRequest) async {
    return await _loginService.login(loginRequest).catchError((error) =>
        throw _errorSeparator.createError(error, StackTrace.current).handle());
  }

  @override
  Future<RefreshResponse?> refresh(RefreshRequest refreshRequest) async {
    return await _loginService.refresh(refreshRequest).catchError((error) =>
        throw _errorSeparator.createError(error, StackTrace.current).handle());
  }
}

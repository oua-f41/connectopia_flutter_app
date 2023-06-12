import 'package:injectable/injectable.dart';

import '../../../../core/error/error_extension.dart';
import '../../../../core/error/error_separator.dart';
import '../../../models/user/request/create_user_request.dart';
import '../../../models/user/response/user_response.dart';
import '../dataAccess/user_service.dart';

abstract class IUserRepository {
  Future<UserResponse?> addUser(CreateUserRequest userRequest);
  Future<UserResponse?> getByUserId(String userId);
}

@Injectable(as: IUserRepository)
class UserRepository implements IUserRepository {
  final IUserService _userService;
  final ErrorSeparator _errorSeparator;

  UserRepository(this._userService, this._errorSeparator);

  @override
  Future<UserResponse?> addUser(CreateUserRequest userRequest) async {
    return await _userService.addUser(userRequest).catchError((error) =>
        throw _errorSeparator.createError(error, StackTrace.current).handle());
  }

  @override
  Future<UserResponse?> getByUserId(String userId) async {
    return await _userService.getByUserId(userId).catchError((error) =>
        throw _errorSeparator.createError(error, StackTrace.current).handle());
  }
}

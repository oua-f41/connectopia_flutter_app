import '../../../../core/error/error_extension.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/error_separator.dart';
import '../../../../product/models/response_data.dart';
import '../../domain/models/request/user_group_request.dart';
import '../data_access/user_group_service.dart';

abstract class IUserGroupRepository {
  Future<ResponseData?> add(UserGroupRequest userGroupRequest);
  Future<ResponseData?> delete(String id);
}

@Injectable(as: IUserGroupRepository)
class UserGroupRepository implements IUserGroupRepository {
  final IUserGroupService _userGroupService;
  final ErrorSeparator _errorSeparator;

  UserGroupRepository(this._userGroupService, this._errorSeparator);

  @override
  Future<ResponseData?> add(UserGroupRequest userGroupRequest) async {
    return await _userGroupService.add(userGroupRequest).catchError((error) =>
        throw _errorSeparator.createError(error, StackTrace.current).handle());
  }

  @override
  Future<ResponseData?> delete(String id) async {
    return await _userGroupService.delete(id).catchError((error) =>
        throw _errorSeparator.createError(error, StackTrace.current).handle());
  }
}

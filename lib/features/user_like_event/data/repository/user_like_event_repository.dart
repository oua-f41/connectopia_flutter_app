import 'package:connectopia/features/user_like_event/domain/response/user_like_event_response.dart';

import '../../../../core/error/error_extension.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/error_separator.dart';
import '../../../../product/models/response_data.dart';
import '../../domain/request/user_like_event_request.dart';
import '../data_access/user_like_event_service.dart';

abstract class IUserLikeEventRepository {
  Future<UserLikeEventResponse?> add(UserLikeEventRequest userLikeEventRequest);
  Future<ResponseData?> delete(String id);
}

@Injectable(as: IUserLikeEventRepository)
class UserLikeEventRepository implements IUserLikeEventRepository {
  final IUserLikeEventService _userLikeEventService;
  final ErrorSeparator _errorSeparator;

  UserLikeEventRepository(this._userLikeEventService, this._errorSeparator);

  @override
  Future<UserLikeEventResponse?> add(
      UserLikeEventRequest userLikeEventRequest) async {
    return await _userLikeEventService.add(userLikeEventRequest).catchError(
        (error) => throw _errorSeparator
            .createError(error, StackTrace.current)
            .handle());
  }

  @override
  Future<ResponseData?> delete(String id) async {
    return await _userLikeEventService.delete(id).catchError((error) =>
        throw _errorSeparator.createError(error, StackTrace.current).handle());
  }
}

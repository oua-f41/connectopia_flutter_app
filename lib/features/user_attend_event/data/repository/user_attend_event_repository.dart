import '../../../../core/error/error_extension.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/error_separator.dart';
import '../../../../product/models/response_data.dart';
import '../../domain/request/user_attend_event_request.dart';
import '../../domain/response/user_attend_event_response.dart';
import '../data_access/user_attend_event_service.dart';

abstract class IUserAttendEventRepository {
  Future<UserAttendEventResponse?> add(
      UserAttendEventRequest userAttendEventRequest);
  Future<ResponseData?> delete(String id);
}

@Injectable(as: IUserAttendEventRepository)
class UserAttendEventRepository implements IUserAttendEventRepository {
  final IUserAttendEventService _userAttendEventService;
  final ErrorSeparator _errorSeparator;

  UserAttendEventRepository(this._userAttendEventService, this._errorSeparator);

  @override
  Future<UserAttendEventResponse?> add(
      UserAttendEventRequest userAttendEventRequest) async {
    return await _userAttendEventService.add(userAttendEventRequest).catchError(
        (error) => throw _errorSeparator
            .createError(error, StackTrace.current)
            .handle());
  }

  @override
  Future<ResponseData?> delete(String id) async {
    return await _userAttendEventService.delete(id).catchError((error) =>
        throw _errorSeparator.createError(error, StackTrace.current).handle());
  }
}

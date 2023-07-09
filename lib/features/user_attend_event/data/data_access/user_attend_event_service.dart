import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../product/models/response_data.dart';
import '../../domain/request/user_attend_event_request.dart';
import '../../domain/response/user_attend_event_response.dart';

part 'user_attend_event_service.g.dart';

abstract class IUserAttendEventService {
  Future<UserAttendEventResponse?> add(
      @Body() UserAttendEventRequest userLikeEventRequest);
  Future<ResponseData?> delete(@Query("id") String id);
}

@RestApi()
@Injectable(as: IUserAttendEventService)
abstract class UserAttendEventManager implements IUserAttendEventService {
  @factoryMethod
  factory UserAttendEventManager(Dio dio) => _UserAttendEventManager(dio);

  @override
  @POST("/userAttendEvents/add")
  Future<UserAttendEventResponse?> add(
      @Body() UserAttendEventRequest userAttendEventRequest);

  @override
  @DELETE("/userAttendEvents/delete")
  Future<ResponseData?> delete(@Query("id") String id);
}

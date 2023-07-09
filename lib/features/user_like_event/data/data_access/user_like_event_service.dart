import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../product/models/response_data.dart';
import '../../domain/request/user_like_event_request.dart';
import '../../domain/response/user_like_event_response.dart';

part 'user_like_event_service.g.dart';

abstract class IUserLikeEventService {
  Future<UserLikeEventResponse?> add(
      @Body() UserLikeEventRequest userLikeEventRequest);
  Future<ResponseData?> delete(@Query("id") String id);
}

@RestApi()
@Injectable(as: IUserLikeEventService)
abstract class UserLikeEventManager implements IUserLikeEventService {
  @factoryMethod
  factory UserLikeEventManager(Dio dio) => _UserLikeEventManager(dio);

  @override
  @POST("/userLikeEvents/add")
  Future<UserLikeEventResponse?> add(
      @Body() UserLikeEventRequest userLikeEventRequest);

  @override
  @DELETE("/userLikeEvents/delete")
  Future<ResponseData?> delete(@Query("id") String id);
}

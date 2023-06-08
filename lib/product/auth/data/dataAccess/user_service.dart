import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import '../../../models/user/request/user_request.dart';
import '../../../models/user/response/user_response.dart';

part 'user_service.g.dart';

abstract class IUserService {
  Future<UserResponse?> addUser(@Body() UserRequest userRequest);
  Future<UserResponse?> getByUserId(@Query("userId") String userId);
}

@RestApi()
@Injectable(as: IUserService)
abstract class UserManager implements IUserService {
  @factoryMethod
  factory UserManager(Dio dio) => _UserManager(dio);

  @override
  @POST("/users/add")
  Future<UserResponse?> addUser(@Body() UserRequest userRequest);

  @override
  @GET("/users/getById")
  Future<UserResponse?> getByUserId(@Query("userId") String userId);
}

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:connectopia/features/user_group/domain/models/request/user_group_request.dart';
import 'package:connectopia/product/models/user/request/user_request.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../product/models/response_data.dart';

part 'user_group_service.g.dart';

abstract class IUserGroupService {
  Future<ResponseData?> add(@Body() UserGroupRequest userGroupRequest);
  Future<ResponseData?> delete(@Query("id") String id);
}

@RestApi()
@Injectable(as: IUserGroupService)
abstract class UserGroupManager implements IUserGroupService {
  @factoryMethod
  factory UserGroupManager(Dio dio) => _UserGroupManager(dio);

  @override
  @POST("/userGroups/add")
  Future<ResponseData?> add(@Body() UserGroupRequest userGroupRequest);

  @override
  @DELETE("/userGroups/delete")
  Future<ResponseData?> delete(@Query("id") String id);
}

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../product/models/response_data.dart';
import '../../domain/request/register_request.dart';

part 'register_service.g.dart';

abstract class IRegisterService {
  Future<ResponseData?> register(RegisterRequest registerRequest);
}

@RestApi()
@Injectable(as: IRegisterService)
abstract class RegisterManager implements IRegisterService {
  @factoryMethod
  factory RegisterManager(Dio dio) => _RegisterManager(dio);

  @override
  @POST("/users/update")
  Future<ResponseData?> register(@Body() RegisterRequest registerRequest);
}

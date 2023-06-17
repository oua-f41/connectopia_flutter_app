import '../../../../core/error/error_extension.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/error_separator.dart';
import '../../../../product/models/response_data.dart';
import '../../domain/request/register_request.dart';
import '../data_access/register_service.dart';

abstract class IRegisterRepository {
  Future<ResponseData?> register(RegisterRequest registerRequest);
}

@Injectable(as: IRegisterRepository)
class RegisterRepository implements IRegisterRepository {
  final IRegisterService _registerService;
  final ErrorSeparator _errorSeparator;

  RegisterRepository(this._registerService, this._errorSeparator);

  @override
  Future<ResponseData?> register(RegisterRequest registerRequest) async {
    return await _registerService.register(registerRequest).catchError(
        (error) => throw _errorSeparator
            .createError(error, StackTrace.current)
            .handle());
  }
}

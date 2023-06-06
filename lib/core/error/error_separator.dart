import 'package:dio/dio.dart';
import 'package:f41/core/error/error_models/api_error_model.dart';

import 'default_error_factory.dart';
import 'error.dart';

class ErrorSeparator {
  final DefaultErrorFactory errorFactory;

  ErrorSeparator(this.errorFactory);

  DefaultError createError(Object exception, StackTrace stackTrace) {
    try {
      if (exception is DioError) {
        return errorFactory.createApiError(exception, stackTrace,
            ApiErrorModel.fromJson(exception.response?.data));
      } else {
        return errorFactory.createBusinessError(exception, stackTrace);
      }
    } catch (e, stackTrace) {
      return errorFactory.createUnknownError(e.toString(), stackTrace);
    }
  }
}

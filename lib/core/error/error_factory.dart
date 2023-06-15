import 'package:connectopia/core/error/error_models/api_error_model.dart';

import 'error.dart';

abstract class ErrorFactory {
  DefaultError createApiError(
      dynamic error, StackTrace stackTrace, ApiErrorModel errorModel);
  DefaultError createBusinessError(dynamic error, StackTrace stackTrace);
  DefaultError createUnknownError(dynamic error, StackTrace stackTrace);
}

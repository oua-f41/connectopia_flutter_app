import 'package:connectopia/core/error/error_models/api_error_model.dart';

import 'error.dart';
import 'error_factory.dart';

class DefaultErrorFactory extends ErrorFactory {
  @override
  DefaultError createApiError(
          error, StackTrace stackTrace, ApiErrorModel errorModel) =>
      DefaultError.apiError(error, stackTrace, errorModel);

  @override
  DefaultError createBusinessError(error, StackTrace stackTrace) =>
      DefaultError.businessError(error, stackTrace);

  @override
  DefaultError createUnknownError(error, StackTrace stackTrace) =>
      DefaultError.unknownError(error, stackTrace);
}

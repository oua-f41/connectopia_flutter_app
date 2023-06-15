import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:connectopia/core/error/error_models/api_error_model.dart';

part 'error.freezed.dart';

@freezed
class DefaultError with _$DefaultError {
  const factory DefaultError.apiError(
          dynamic error, StackTrace stackTrace, ApiErrorModel errorModel) =
      _ApiError;
  const factory DefaultError.businessError(
      dynamic error, StackTrace stackTrace) = _BusinessError;
  const factory DefaultError.unknownError(
      dynamic error, StackTrace stackTrace) = _UnknownError;
}

import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  String? error;
  ApiErrorModel({
    this.error,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);
}

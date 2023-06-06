import 'package:json_annotation/json_annotation.dart';
part 'refresh_response.g.dart';

@JsonSerializable(createToJson: false)
class RefreshResponse {
  String? token;

  RefreshResponse({
    this.token,
  });

  factory RefreshResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseFromJson(json);
}

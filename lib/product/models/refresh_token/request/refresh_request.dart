import 'package:json_annotation/json_annotation.dart';
part 'refresh_request.g.dart';

@JsonSerializable(createFactory: false)
class RefreshRequest {
  String? refresh;

  RefreshRequest({
    this.refresh,
  });

  Map<String, dynamic> toJson() => _$RefreshRequestToJson(this);
}

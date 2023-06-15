import 'package:json_annotation/json_annotation.dart';

part 'response_data.g.dart';

@JsonSerializable(createToJson: false)
class ResponseData {
  String? message;
  ResponseData({this.message});

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  ResponseData copyWith({String? message}) {
    return ResponseData(message: message ?? this.message);
  }
}

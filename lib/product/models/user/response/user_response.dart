import 'package:hive_flutter/adapters.dart';
import '../../base_response.dart';

class UserResponse extends BaseResponse {
  @HiveField(1)
  String? name;

  UserResponse({this.name, super.id});
}

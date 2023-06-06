import 'package:hive/hive.dart';

class BaseResponse {
  @HiveField(0)
  String? id;

  BaseResponse({this.id});
}

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../product/models/response_data.dart';
import '../../domain/models/request/notification_request.dart';

part 'notification_service.g.dart';

abstract class INotificationService {
  Future<ResponseData?> sendMessage(
      @Body() NotificationRequest notificationRequest);
}

@RestApi()
@Injectable(as: INotificationService)
abstract class NotificationManager implements INotificationService {
  @factoryMethod
  factory NotificationManager(Dio dio) => _NotificationManager(dio);

  @override
  @POST("/notification/sendMessage")
  Future<ResponseData?> sendMessage(
      @Body() NotificationRequest notificationRequest);
}

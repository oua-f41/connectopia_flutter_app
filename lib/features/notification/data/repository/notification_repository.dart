import 'package:connectopia/features/notification/domain/models/request/notification_request.dart';

import '../../../../core/error/error_extension.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/error_separator.dart';
import '../../../../product/models/response_data.dart';
import '../data_access/notification_service.dart';

abstract class INotificationRepository {
  Future<ResponseData?> sendMessage(NotificationRequest notificationRequest);
}

@Injectable(as: INotificationRepository)
class NotificationRepository implements INotificationRepository {
  final INotificationService _notificationService;
  final ErrorSeparator _errorSeparator;

  NotificationRepository(this._notificationService, this._errorSeparator);

  @override
  Future<ResponseData?> sendMessage(
      NotificationRequest notificationRequest) async {
    return await _notificationService
        .sendMessage(notificationRequest)
        .catchError((error) => throw _errorSeparator
            .createError(error, StackTrace.current)
            .handle());
  }
}

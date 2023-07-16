import 'dart:convert';

import 'package:connectopia/app/app_router.dart';
import 'package:connectopia/features/profile/data/repository/profile_repository.dart';
import 'package:connectopia/product/di/injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../features/profile/domain/models/response/profile_response.dart';
import '../models/core_models/event.dart';

class FirebaseNotification {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _localNotifications = FlutterLocalNotificationsPlugin();

  final _profileRepository = getIt.get<IProfileRepository>();

  final _androidChannel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.defaultImportance);

  Future<void> initLocalNotifications() async {
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(android: android);

    await _localNotifications.initialize(settings,
        onSelectNotification: (payload) {
      final message = RemoteMessage.fromMap(jsonDecode(payload!));
      handleMessage(message);
    });

    final platform = _localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    await subscribeToGroups();
    await subscribeToPersonal();

    initPushNotifications();
    initLocalNotifications();
  }

  Future initPushNotifications() async {
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: false, badge: false, sound: false);
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        handleMessage(message);
      }
    });
    FirebaseMessaging.onBackgroundMessage(handleMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
                _androidChannel.id, _androidChannel.name,
                channelDescription: _androidChannel.description,
                icon: "@drawable/ic_launcher"),
          ),
          payload: jsonEncode(message.toMap()));
    });
  }

  Future<void> handleMessage(RemoteMessage message) async {
    if (message.data['route'] != null) {
      if (message.data['route'] == "chat" && message.data['id'] != null) {
        getIt.get<AppRouter>().push(AppWrapperRoute(children: [
              const MainRoute(children: [HomeRoute()]),
              ChatRoute(
                  profileResponse: ProfileResponse(id: message.data['id']))
            ]));
      }
      if (message.data['route'] == "event" && message.data['id'] != null) {
        getIt.get<AppRouter>().push(AppWrapperRoute(children: [
              const MainRoute(children: [HomeRoute()]),
              EventDetailRoute(event: Event(id: message.data['id']))
            ]));
      }
    }
  }

  Future<void> subscribeToGroups() async {
    if (FirebaseAuth.instance.currentUser == null) return;
    ProfileResponse? currentUser = await _profileRepository
        .getByUserId(FirebaseAuth.instance.currentUser!.uid);
    currentUser?.userGroups?.forEach((e) => {
          if (e.groupId != null)
            {
              _firebaseMessaging.subscribeToTopic(e.group!.id!),
            }
        });
  }

  Future<void> unSubscribeToGroups() async {
    if (FirebaseAuth.instance.currentUser == null) return;
    ProfileResponse? currentUser = await _profileRepository
        .getByUserId(FirebaseAuth.instance.currentUser!.uid);
    currentUser?.userGroups?.forEach((e) => {
          if (e.groupId != null)
            {
              _firebaseMessaging.unsubscribeFromTopic(e.group!.id!),
            }
        });
  }

  Future<void> subscribeToPersonal() async {
    if (FirebaseAuth.instance.currentUser == null) return;
    await _firebaseMessaging
        .subscribeToTopic(FirebaseAuth.instance.currentUser!.uid);
  }

  Future<void> unSubscribeToPersonal() async {
    if (FirebaseAuth.instance.currentUser == null) return;
    await _firebaseMessaging
        .unsubscribeFromTopic(FirebaseAuth.instance.currentUser!.uid);
  }
}

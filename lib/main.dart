import 'package:connectopia/product/di/injection.dart';
import 'package:connectopia/product/helpers/firebase_notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/connectopia_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await getIt.get<FirebaseNotification>().initNotifications();
  await getIt.get<FirebaseNotification>().initLocalNotifications();
  runApp(const ConnectopiaApp());
}

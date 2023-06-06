import 'package:f41/core/helpers/refresh_token.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'app/student_app.dart';

import 'product/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  await configureDependencies();
  await SetupToken.refreshToken();
  runApp(StudentApp());
}

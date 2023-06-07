import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/student_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(StudentApp());
}

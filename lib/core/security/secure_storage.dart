import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class SecureStorageModule {
  @singleton
  FlutterSecureStorage secureStorage() {
    return const FlutterSecureStorage();
  }
}

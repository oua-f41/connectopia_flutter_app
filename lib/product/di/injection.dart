import 'package:f41/app/app_router.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../../app/student_app_cubit.dart';
import '../../core/helpers/properties_app.dart';

import '../../core/error/default_error_factory.dart';
import '../../core/error/error_factory.dart';
import '../../core/error/error_separator.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  getIt.init();

  getIt.registerLazySingleton(() => StudentAppCubit());
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());

  getIt.registerLazySingleton(() => ErrorFactory);
  getIt.registerLazySingleton(() => DefaultErrorFactory());
  getIt.registerLazySingleton(() => ErrorSeparator(getIt.get()));

  getIt.registerLazySingleton(() => PropertiesApp());
}

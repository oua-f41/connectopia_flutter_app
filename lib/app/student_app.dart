import 'package:f41/product/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:f41/app/student_app_cubit.dart';
import 'package:f41/core/helpers/globals.dart';
import 'package:f41/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:f41/product/constants/theme.dart';

import 'app_router.dart';

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => StudentAppCubit())],
      child: BlocBuilder<StudentAppCubit, StudentAppViewModel>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Student App',
            debugShowCheckedModeBanner: false,
            theme: ThemeConsts.light,
            darkTheme: ThemeConsts.dark,
            themeMode: state.themeMode,
            routerConfig: getIt.get<AppRouter>().config(),
            scaffoldMessengerKey: snackbarKey,
            supportedLocales: L10n.all,
            locale: Locale(state.localeKey.name),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
          );
        },
      ),
    );
  }
}

enum LocaleKeys { en, tr }

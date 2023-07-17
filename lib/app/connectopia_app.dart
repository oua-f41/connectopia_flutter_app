import 'package:connectopia/product/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:connectopia/core/helpers/globals.dart';
import 'package:connectopia/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:connectopia/product/constants/theme.dart';

import 'app_router.dart';
import 'connectopia_app_cubit.dart';

class ConnectopiaApp extends StatelessWidget {
  const ConnectopiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt.get<ConnectopiaAppCubit>()),
      ],
      child: BlocBuilder<ConnectopiaAppCubit, ConnectopiaAppViewModel>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Connectopia',
            debugShowCheckedModeBanner: false,
            theme: ThemeConsts.light,
            darkTheme: ThemeConsts.dark,
            themeMode: state.themeMode,
            routerConfig: getIt.get<AppRouter>().config(),
            scaffoldMessengerKey: snackbarKey,
            supportedLocales: L10n.all,
            locale: Locale(state.localeKey?.name ?? 'tr'),
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

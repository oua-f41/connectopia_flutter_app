// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:connectopia/app/base_cubit.dart';
import 'package:hive_flutter/adapters.dart';

import '../core/presentation/base_view_model.dart';
import '../product/cache/application_properties.dart';
import '../product/cache/application_properties_manager.dart';
import '../product/cache/cache_enums.dart';
import '../product/di/injection.dart';

class ConnectopiaAppCubit extends BaseCubit<ConnectopiaAppViewModel> {
  ConnectopiaAppCubit()
      : super(ConnectopiaAppViewModel(
            themeMode: ThemeMode.system, isLoading: false)) {
    init();
  }

  late final ApplicationPropertiesManager _applicationPropertiesManager;
  late final ApplicationProperties? _applicationProperties;

  void init() async {
    await Hive.initFlutter();
    await getIt.get<ApplicationPropertiesManager>().init();
    _applicationPropertiesManager = getIt.get<ApplicationPropertiesManager>();

    _applicationProperties = _applicationPropertiesManager
        .getItem(CacheEnums.applicationProperties.name);

    if (_applicationProperties?.isDarkMode ?? false) {
      emit(state.copyWith(themeMode: ThemeMode.dark));
    } else {
      emit(state.copyWith(themeMode: ThemeMode.light));
    }

    if (_applicationProperties?.locale != null) {
      if (_applicationProperties?.locale == LocaleKeys.en.name) {
        emit(state.copyWith(localeKey: LocaleKeys.en));
      } else if (_applicationProperties?.locale == LocaleKeys.tr.name) {
        emit(state.copyWith(localeKey: LocaleKeys.tr));
      }
    }
  }

  void changeLocale(LocaleKeys localeKey) {
    emit(state.copyWith(localeKey: localeKey));

    _applicationPropertiesManager.putItem(
        CacheEnums.applicationProperties.name,
        _applicationProperties?.copyWith(locale: localeKey.name) ??
            ApplicationProperties(locale: localeKey.name));
  }

  void changeTheme() async {
    if (state.themeMode == ThemeMode.dark) {
      emit(state.copyWith(themeMode: ThemeMode.light));
      _applicationPropertiesManager.putItem(
          CacheEnums.applicationProperties.name,
          _applicationProperties?.copyWith(isDarkMode: false) ??
              ApplicationProperties(isDarkMode: false));
    } else {
      emit(state.copyWith(themeMode: ThemeMode.dark));
      _applicationPropertiesManager.putItem(
          CacheEnums.applicationProperties.name,
          _applicationProperties?.copyWith(isDarkMode: true) ??
              ApplicationProperties(isDarkMode: true));
    }
  }

  void changeIsLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}

@immutable
class ConnectopiaAppViewModel extends BaseViewModel {
  ConnectopiaAppViewModel({
    this.localeKey,
    this.themeMode,
    super.isLoading,
  });

  late LocaleKeys? localeKey;
  late ThemeMode? themeMode;

  @override
  List<Object?> get props => [localeKey, isLoading, themeMode];

  ConnectopiaAppViewModel copyWith({
    LocaleKeys? localeKey,
    ThemeMode? themeMode,
    bool? isLoading,
  }) {
    return ConnectopiaAppViewModel(
      isLoading: isLoading ?? this.isLoading,
      localeKey: localeKey ?? this.localeKey,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

enum LocaleKeys { en, tr }

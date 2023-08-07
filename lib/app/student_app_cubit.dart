// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:f41/app/base_cubit.dart';
import 'package:f41/app/student_app.dart';

import '../core/presentation/base_view_model.dart';

class StudentAppCubit extends BaseCubit<StudentAppViewModel> {
  StudentAppCubit()
      : super(StudentAppViewModel(
            localeKey: LocaleKeys.en,
            themeMode: ThemeMode.light,
            isLoading: false));

  void changeLocale(LocaleKeys localeKey) {
    emit(state.copyWith(localeKey: localeKey));
  }

  void changeTheme() async {
    if (state.themeMode == ThemeMode.dark) {
      emit(state.copyWith(themeMode: ThemeMode.light));
    } else {
      emit(state.copyWith(themeMode: ThemeMode.dark));
    }
  }

  void changeIsLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }
}

@immutable
class StudentAppViewModel extends BaseViewModel {
  StudentAppViewModel(
      {required this.localeKey, this.themeMode, super.isLoading});

  late LocaleKeys localeKey;
  late ThemeMode? themeMode;

  @override
  List<Object?> get props => [localeKey, isLoading, themeMode];

  StudentAppViewModel copyWith({
    LocaleKeys? localeKey,
    ThemeMode? themeMode,
    bool? isLoading,
  }) {
    return StudentAppViewModel(
      isLoading: isLoading ?? this.isLoading,
      localeKey: localeKey ?? this.localeKey,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
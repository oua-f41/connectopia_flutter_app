import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class BaseViewModel extends Equatable {
  BaseViewModel({this.isLoading = false});

  bool isLoading;

  @override
  List<Object?> get props => [];
}

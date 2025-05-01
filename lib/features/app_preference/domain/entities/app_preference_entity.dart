import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AppPreferenceEntity extends Equatable {
  const AppPreferenceEntity({
    required this.themeMode,
    required this.textScaler,
    this.locale,
  });

  final ThemeMode themeMode;
  final TextScaler textScaler;
  final Locale? locale;

  AppPreferenceEntity copyWith({
    ThemeMode? themeMode,
    TextScaler? textScaler,
    NullableParameter<Locale?>? locale,
  }) {
    return AppPreferenceEntity(
      themeMode: themeMode ?? this.themeMode,
      textScaler: textScaler ?? this.textScaler,
      locale: locale != null ? locale.value : this.locale,
    );
  }

  @override
  List<Object?> get props {
    return [
      themeMode,
      textScaler,
      locale,
    ];
  }
}

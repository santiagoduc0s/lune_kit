import 'package:equatable/equatable.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/domain/entities/entities.dart';

class PreferenceEntity extends Equatable {
  const PreferenceEntity({
    required this.themeMode,
    required this.textScaler,
    this.locale,
  });

  final ThemeModePreference themeMode;
  final double textScaler;
  final String? locale;

  PreferenceEntity copyWith({
    ThemeModePreference? themeMode,
    double? textScaler,
    NullableParameter<String?>? locale,
  }) {
    return PreferenceEntity(
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

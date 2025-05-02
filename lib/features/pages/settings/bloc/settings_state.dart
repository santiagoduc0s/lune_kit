import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  const SettingsState();

  const SettingsState.initial();

  SettingsState copyWith() {
    return const SettingsState();
  }

  @override
  List<Object> get props => [];
}

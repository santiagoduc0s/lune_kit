import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lune/features/settings/bloc/bloc.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState.initial());
}

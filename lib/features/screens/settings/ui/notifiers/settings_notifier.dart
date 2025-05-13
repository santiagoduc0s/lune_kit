import 'package:flutter/material.dart';

class SettingsNotifier extends ChangeNotifier {
  SettingsNotifier({required this.onSignOut});

  final void Function() onSignOut;
}

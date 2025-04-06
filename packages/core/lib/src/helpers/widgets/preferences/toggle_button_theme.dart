import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// This widget is used to change the theme of the app.
class ToggleButtonTheme extends StatefulWidget {
  /// Creates an instance of [ToggleButtonTheme].
  const ToggleButtonTheme({super.key});

  @override
  State<ToggleButtonTheme> createState() => _ToggleButtonThemeState();
}

class _ToggleButtonThemeState extends State<ToggleButtonTheme> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appPreference = context.watch<AppPreference>();

    final themeMode = appPreference.themeMode;

    return ToggleButtons(
      borderRadius: BorderRadius.circular(2.space),
      isSelected: [
        themeMode == ThemeMode.light,
        themeMode == ThemeMode.dark,
        themeMode == ThemeMode.system,
      ],
      onPressed: (int index) {
        switch (index) {
          case 0:
            AppPreference.instance.setThemeMode(ThemeMode.light);
          case 1:
            AppPreference.instance.setThemeMode(ThemeMode.dark);
          case 2:
            AppPreference.instance.setThemeMode(ThemeMode.system);
        }
      },
      children: const [
        Icon(Icons.wb_sunny_outlined),
        Icon(Icons.nights_stay_outlined),
        Icon(Icons.brightness_6_outlined),
      ],
    );
  }
}

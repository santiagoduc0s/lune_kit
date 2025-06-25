import 'package:flutter/material.dart';
import 'package:lune/core/ui/spacing/spacing.dart';
import 'package:lune/domain/entities/entities.dart';
import 'package:lune/ui/preferences/notifiers/notifiers.dart';
import 'package:provider/provider.dart';

class ToggleButtonTheme extends StatelessWidget {
  const ToggleButtonTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<PreferenceNotifier>().prefs;

    final themeMode = prefs!.themeMode;

    return ToggleButtons(
      borderRadius: BorderRadius.circular(2.space),
      isSelected: [
        themeMode == ThemeModePreference.light,
        themeMode == ThemeModePreference.dark,
        themeMode == ThemeModePreference.system,
      ],
      onPressed: (int index) {
        switch (index) {
          case 0:
            context
                .read<PreferenceNotifier>()
                .setThemeMode(ThemeModePreference.light);
          case 1:
            context
                .read<PreferenceNotifier>()
                .setThemeMode(ThemeModePreference.dark);
          case 2:
            context
                .read<PreferenceNotifier>()
                .setThemeMode(ThemeModePreference.system);
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

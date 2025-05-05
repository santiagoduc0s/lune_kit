import 'package:flutter/material.dart';
import 'package:lune/core/ui/spacing/spacing.dart';
import 'package:lune/features/core/app_preference/ui/notifier/notifier.dart';
import 'package:provider/provider.dart';

class ToggleButtonTheme extends StatelessWidget {
  const ToggleButtonTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<AppPreferenceNotifier>().prefs;

    final themeMode = prefs.themeMode;

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
            context.read<AppPreferenceNotifier>().setThemeMode(ThemeMode.light);
          case 1:
            context.read<AppPreferenceNotifier>().setThemeMode(ThemeMode.dark);
          case 2:
            context
                .read<AppPreferenceNotifier>()
                .setThemeMode(ThemeMode.system);
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

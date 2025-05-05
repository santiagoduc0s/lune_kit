import 'package:flutter/material.dart';
import 'package:lune/core/ui/spacing/spacing.dart';
import 'package:lune/features/core/app_preference/ui/notifier/notifier.dart';
import 'package:provider/provider.dart';

/// A slider widget to adjust the text scaling factor.
class ToggleTextScale extends StatelessWidget {
  /// Creates an instance of [ToggleTextScale].
  const ToggleTextScale({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<AppPreferenceNotifier>().prefs;

    // ignore: deprecated_member_use
    final textScaleFactor = prefs.textScaler.textScaleFactor;

    return ToggleButtons(
      borderRadius: BorderRadius.circular(2.space),
      isSelected: [
        textScaleFactor == 1,
        textScaleFactor == 1.5,
        textScaleFactor == 2,
      ],
      onPressed: (int index) {
        switch (index) {
          case 0:
            context.read<AppPreferenceNotifier>().setTextScaler(1);
          case 1:
            context.read<AppPreferenceNotifier>().setTextScaler(1.5);
          case 2:
            context.read<AppPreferenceNotifier>().setTextScaler(2);
        }
      },
      children: const [
        Text('1'),
        Text('1.5'),
        Text('2'),
      ],
    );
  }
}

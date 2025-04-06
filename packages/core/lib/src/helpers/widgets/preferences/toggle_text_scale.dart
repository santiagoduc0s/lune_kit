import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// A slider widget to adjust the text scaling factor.
class ToggleTextScale extends StatefulWidget {
  /// Creates an instance of [ToggleTextScale].
  const ToggleTextScale({super.key});

  @override
  State<ToggleTextScale> createState() => _ToggleTextScaleState();
}

class _ToggleTextScaleState extends State<ToggleTextScale> {
  late double currentValue;

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    currentValue = AppPreference.instance.textScaler.textScaleFactor;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final currentValue = MediaQuery.of(context).textScaleFactor;

    return ToggleButtons(
      borderRadius: BorderRadius.circular(2.space),
      isSelected: [
        currentValue == 1,
        currentValue == 1.5,
        currentValue == 2,
      ],
      onPressed: (int index) {
        switch (index) {
          case 0:
            AppPreference.instance.setTextScaler(1);
          case 1:
            AppPreference.instance.setTextScaler(1.5);
          case 2:
            AppPreference.instance.setTextScaler(2);
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

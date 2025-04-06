import 'package:core/core.dart';
import 'package:example/features/settings/widgets/widgets.dart';
import 'package:example/l10n/l10n.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ToggleButtonTheme(),
            SizedBox(height: 5.space),
            const ToggleTextScale(),
            SizedBox(height: 5.space),
            const ListLanguages(),
          ],
        ),
      ),
    );
  }
}

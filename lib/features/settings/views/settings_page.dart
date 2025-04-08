import 'package:core/core.dart';
import 'package:example/features/privacy_policy/views/privacy_policy_screen.dart';
import 'package:example/features/settings/widgets/widgets.dart';
import 'package:example/features/terms_conditions/views/views.dart';
import 'package:example/l10n/l10n.dart';
import 'package:example/router/router.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final buttonStyles = Theme.of(context).buttonStyles;

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
            SizedBox(height: 5.space),
            FilledButton(
              onPressed: () {
                AppRouter.instance.pushNamed<void>(TermsConditionsScreen.path);
              },
              style: buttonStyles.primaryFilled,
              child: const Text('Terms & Conditions'),
            ),
            SizedBox(height: 5.space),
            FilledButton(
              onPressed: () {
                AppRouter.instance.pushNamed<void>(PrivacyPolicyScreen.path);
              },
              style: buttonStyles.primaryFilled,
              child: const Text('Privacy Policy'),
            ),
          ],
        ),
      ),
    );
  }
}

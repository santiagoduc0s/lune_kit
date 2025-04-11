import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:lune/extensions/extensions.dart';
import 'package:lune/features/privacy_policy/views/privacy_policy_screen.dart';
import 'package:lune/features/settings/widgets/widgets.dart';
import 'package:lune/features/terms_conditions/views/views.dart';
import 'package:lune/l10n/l10n.dart';
import 'package:lune/router/router.dart';

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
      body: SingleChildScrollView(
        child: Center(
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
                  AppRouter.instance
                      .pushNamed<void>(TermsConditionsScreen.path);
                },
                style: buttonStyles.primaryFilled,
                child: Text(l10n.termsAndConditions),
              ),
              SizedBox(height: 5.space),
              FilledButton(
                onPressed: () {
                  AppRouter.instance.pushNamed<void>(PrivacyPolicyScreen.path);
                },
                style: buttonStyles.primaryFilled,
                child: Text(l10n.privacyPolicy),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

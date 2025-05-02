import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:lune/config/router/router.dart';
import 'package:lune/core/extensions/extensions.dart';
import 'package:lune/features/core/app_preference/ui/widgets/toggle_button_theme.dart';
import 'package:lune/features/core/app_preference/ui/widgets/toggle_text_scale.dart';
import 'package:lune/features/pages/privacy_policy/views/privacy_policy_screen.dart';
import 'package:lune/features/pages/settings/widgets/widgets.dart';
import 'package:lune/features/pages/terms_conditions/views/views.dart';
import 'package:lune/l10n/l10n.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final buttonStyles = context.buttonStyles;

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

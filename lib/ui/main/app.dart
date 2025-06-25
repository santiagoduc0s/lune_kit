import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lune/core/form/validators/validators.dart';
import 'package:lune/core/ui/themes/themes.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/domain/entities/entities.dart';
import 'package:lune/router/router.dart';
import 'package:lune/ui/preferences/notifiers/notifiers.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<PreferenceNotifier>().prefs;

    final themeMode = prefs?.themeMode.mapToThemeMode() ?? ThemeMode.system;
    final locale = prefs?.locale.mapToLocale();

    return ReactiveFormConfig(
      validationMessages: validationMessages(context),
      child: MaterialApp.router(
        scaffoldMessengerKey: AppGlobalKey.scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        theme: UIThemeLight.instance.theme,
        darkTheme: UIThemeDark.instance.theme,
        themeMode: themeMode,
        locale: locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: context.read<CustomRouter>().router,
        builder: (context, child) {
          final scale = prefs?.textScaler ?? 1.0;
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.linear(scale),
            ),
            child: child!,
          );
        },
      ),
    );
  }
}

extension on ThemeModePreference? {
  ThemeMode mapToThemeMode() {
    switch (this) {
      case ThemeModePreference.light:
        return ThemeMode.light;
      case ThemeModePreference.dark:
        return ThemeMode.dark;
      case ThemeModePreference.system:
      case null:
        return ThemeMode.system;
    }
  }
}

extension on String? {
  Locale? mapToLocale() {
    switch (this) {
      case 'en':
        return const Locale('en');
      case 'es':
        return const Locale('es');
      default:
        return null;
    }
  }
}

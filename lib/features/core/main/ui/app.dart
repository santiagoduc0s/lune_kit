import 'package:flutter/material.dart';
import 'package:lune/config/router/app_router.dart';
import 'package:lune/core/form/validators/validators.dart';
import 'package:lune/core/ui/themes/themes.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/app_preference/ui/notifier/notifier.dart';
import 'package:lune/features/core/auth/ui/notifiers/notifiers.dart';
import 'package:lune/l10n/arb/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<AppPreferenceNotifier>(
            create: (_) => Injector.findSingleton(),
          ),
          ChangeNotifierProvider<AuthNotifier>(
            create: (_) => Injector.findSingleton(),
          ),
        ],
        child: const AppContent(),
      ),
    );
  }
}

class AppContent extends StatelessWidget {
  const AppContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appPreferenceNotifier = context.watch<AppPreferenceNotifier>();

    final appPreference = appPreferenceNotifier.prefs;

    return MaterialApp.router(
      scaffoldMessengerKey: AppGlobalKey.scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      theme: UIThemeLight.instance.theme,
      darkTheme: UIThemeDark.instance.theme,
      themeMode: appPreference.themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: Injector.findSingleton<AppRouter>().router,
      locale: appPreference.locale,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: appPreference.textScaler,
          ),
          child: child!,
        );
      },
    );
  }
}

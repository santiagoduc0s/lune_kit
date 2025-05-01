import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:lune/features/app_preference/ui/notifier/notifier.dart';
import 'package:lune/l10n/arb/app_localizations.dart';
import 'package:lune/router/app_router.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppPreferenceNotifier>(
          create: (_) => Injector.findSingleton(),
        ),
      ],
      child: const AppContent(),
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
      routerConfig: AppRouter.instance.router,
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

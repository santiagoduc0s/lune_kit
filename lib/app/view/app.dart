import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:lune/l10n/l10n.dart';
import 'package:lune/router/app_router.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<AppPreference>(
          updateShouldNotify: (previous, current) => true,
          create: (_) => AppPreference.instance.stream,
          initialData: AppPreference.instance,
          catchError: (_, __) => AppPreference.instance,
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
    final appPreference = context.watch<AppPreference>();

    return MaterialApp.router(
      scaffoldMessengerKey: AppKeys.instance.scaffoldMessengerKey,
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

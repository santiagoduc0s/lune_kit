import 'package:core/core.dart';
import 'package:example/l10n/l10n.dart';
import 'package:example/router/app_router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: UIThemeLight.instance.theme,
      darkTheme: UIThemeDark.instance.theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: AppRouter.instance.router,
    );
  }
}

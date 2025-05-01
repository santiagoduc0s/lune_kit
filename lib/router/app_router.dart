import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lune/features/home/views/views.dart';
import 'package:lune/features/privacy_policy/views/views.dart';
import 'package:lune/features/settings/views/views.dart';
import 'package:lune/features/splash/views/views.dart';
import 'package:lune/features/terms_conditions/views/views.dart';
import 'package:lune/l10n/l10n.dart';
import 'package:lune/ui/widgets/app_wrapper.dart';

class AppRouter {
  AppRouter._singleton();

  static final AppRouter instance = AppRouter._singleton();

  void refresh() {
    return (router as GoRouter).refresh();
  }

  Future<T?> pushNamed<T>(
    String name, {
    Object? extra,
    Map<String, String> pathParameters = const {},
    Map<String, String> queryParameters = const {},
  }) async {
    return (router as GoRouter).pushNamed(
      name,
      extra: extra,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }

  void goNamed(
    String name, {
    Object? extra,
    Map<String, String> pathParameters = const {},
    Map<String, String> queryParameters = const {},
  }) {
    return (router as GoRouter).goNamed(
      name,
      extra: extra,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }

  void pop<T extends Object?>([T? result]) {
    return (router as GoRouter).pop<T>(result);
  }

  RouterConfig<RouteMatchList> router = GoRouter(
    navigatorKey: AppGlobalKey.rootNavigatorKey,
    initialLocation: SplashScreen.path,
    routes: [
      SplashScreen.route(),
      ShellRoute(
        pageBuilder: (context, state, child) {
          return RouteAnimation.fadeTransition(
            key: state.pageKey,
            child: AppWrapper(
              child: child,
            ),
          );
        },
        routes: [
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              final l10n = context.l10n;
              final isPortrait =
                  MediaQuery.of(context).orientation == Orientation.portrait;

              return isPortrait
                  ? Scaffold(
                      body: navigationShell,
                      bottomNavigationBar: NavigationBar(
                        selectedIndex: navigationShell.currentIndex,
                        onDestinationSelected: (int index) {
                          navigationShell.goBranch(
                            index,
                            initialLocation:
                                index == navigationShell.currentIndex,
                          );
                        },
                        destinations: [
                          NavigationDestination(
                            icon: const Icon(Icons.home),
                            label: l10n.home,
                          ),
                          NavigationDestination(
                            icon: const Icon(Icons.settings),
                            label: l10n.settings,
                          ),
                        ],
                      ),
                    )
                  : Scaffold(
                      body: Row(
                        children: [
                          NavigationRail(
                            selectedIndex: navigationShell.currentIndex,
                            onDestinationSelected: (int index) {
                              navigationShell.goBranch(
                                index,
                                initialLocation:
                                    index == navigationShell.currentIndex,
                              );
                            },
                            labelType: NavigationRailLabelType.all,
                            destinations: [
                              NavigationRailDestination(
                                icon: const Icon(Icons.home),
                                label: Text(l10n.home),
                              ),
                              NavigationRailDestination(
                                icon: const Icon(Icons.settings),
                                label: Text(l10n.settings),
                              ),
                            ],
                          ),
                          Expanded(child: navigationShell),
                        ],
                      ),
                    );
            },
            branches: [
              StatefulShellBranch(
                routes: [
                  HomeScreen.route(),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  SettingsScreen.route(
                    routes: [
                      TermsConditionsScreen.route(),
                      PrivacyPolicyScreen.route(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

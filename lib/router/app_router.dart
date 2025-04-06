import 'package:core/core.dart';
import 'package:example/features/home/views/views.dart';
import 'package:example/features/settings/views/views.dart';
import 'package:example/features/splash/views/views.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  void pop<T extends Object?>() {
    return (router as GoRouter).pop<T>();
  }

  RouterConfig<RouteMatchList> router = GoRouter(
    navigatorKey: AppKeys.instance.rootNavigatorKey,
    initialLocation: SplashScreen.path,
    routes: [
      SplashScreen.route(),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return Scaffold(
            body: navigationShell,
            bottomNavigationBar: CustomBottomNavigationBar(
              currentIndex: navigationShell.currentIndex,
              onTabSelected: (index) => navigationShell.goBranch(index),
              items: const [
                CustomBottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                CustomBottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
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
              SettingsScreen.route(),
            ],
          ),
        ],
      ),
    ],
  );
}

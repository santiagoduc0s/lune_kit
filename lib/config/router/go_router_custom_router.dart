import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lune/config/constants/constants.dart';
import 'package:lune/config/router/router.dart';
import 'package:lune/core/ui/animations/animations.dart';
import 'package:lune/core/ui/widgets/widgets.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/auth/ui/notifiers/notifiers.dart';
import 'package:lune/features/core/auth/ui/screens/forgot_password/views/views.dart';
import 'package:lune/features/core/auth/ui/screens/sign_in/views/views.dart';
import 'package:lune/features/core/auth/ui/screens/sign_up/views/views.dart';
import 'package:lune/features/screens/home/ui/views/views.dart';
import 'package:lune/features/screens/privacy_policy/ui/views/views.dart';
import 'package:lune/features/screens/public_onboard/ui/views/views.dart';
import 'package:lune/features/screens/settings/ui/views/views.dart';
import 'package:lune/features/screens/splash/ui/views/views.dart';
import 'package:lune/features/screens/terms_conditions/ui/views/views.dart';
import 'package:lune/l10n/l10n.dart';
import 'package:provider/provider.dart';

class GoRouterCustomRouter extends CustomRouter {
  GoRouterCustomRouter() {
    router = GoRouter(
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
            PublicOnboardScreen.route(),
            SignInScreen.route(
              routes: [
                SignUpScreen.route(),
                ForgotPasswordScreen.route(),
              ],
            ),
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
      redirect: AppConstant.authIsActive ? _redirect : null,
    );
  }

  @override
  late RouterConfig<Object> router;

  final publicRoutes = [
    PublicOnboardScreen.path,
    SignInScreen.path,
    '${SignInScreen.path}${SignUpScreen.path}',
    '${SignInScreen.path}${ForgotPasswordScreen.path}',
  ];

  FutureOr<String?> _redirect(
    BuildContext context,
    GoRouterState state,
  ) {
    final isSignedIn = context.read<AuthNotifier>().isLoggedIn;

    final route = state.fullPath;
    final realRedirectTo = state.uri.toString();
    final isPrivateRoute = !publicRoutes.contains(route);

    if (route == SplashScreen.path) {
      return null;
    }

    if (isPrivateRoute && !isSignedIn) {
      return SignInScreen.path;
    }

    if (isSignedIn && publicRoutes.contains(route)) {
      return HomeScreen.path;
    }

    return realRedirectTo;
  }

  @override
  void refresh() {
    return (router as GoRouter).refresh();
  }

  @override
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

  @override
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

  @override
  void pop<T extends Object?>([T? result]) {
    return (router as GoRouter).pop<T>(result);
  }
}

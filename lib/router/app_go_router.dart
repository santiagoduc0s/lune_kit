import 'dart:async';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:lune/core/ui/alerts/dialog/dialog.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/l10n/l10n.dart';
import 'package:lune/router/router.dart';
import 'package:lune/ui/ui.dart';
import 'package:provider/provider.dart';

class AppGoRouter extends CustomRouter {
  AppGoRouter(AuthNotifier authNotifier) : _authNotifier = authNotifier {
    router = GoRouter(
      observers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
      ],
      // refreshListenable: _authNotifier,
      navigatorKey: AppGlobalKey.rootNavigatorKey,
      initialLocation: SplashScreen.path,
      debugLogDiagnostics: true,
      routes: [
        SplashScreen.route(),
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

            Future<void> onDestinationSelected(int index) async {
              if (authNotifier.isNotAuthenticated && index == 0) {
                final dialog = context.read<CustomDialog>();
                var wantToSignIn = await dialog.showWithoutContext<bool>(
                  builder: (context) => ConfirmDialog(
                    message: l10n.confirmSignInProfile,
                    confirmText: l10n.iWantIt,
                    cancelText: l10n.cancel,
                  ),
                );

                wantToSignIn ??= false;

                if (wantToSignIn) {
                  await pushNamed<void>(SignInScreen.path);
                  if (authNotifier.isNotAuthenticated) return;
                } else {
                  return;
                }
              }
              navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              );
            }

            return isPortrait
                ? Scaffold(
                    body: navigationShell,
                    bottomNavigationBar: NavigationBar(
                      selectedIndex: navigationShell.currentIndex,
                      onDestinationSelected: onDestinationSelected,
                      destinations: [
                        NavigationDestination(
                          icon: const Icon(Icons.person),
                          label: l10n.profile,
                        ),
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
                          onDestinationSelected: onDestinationSelected,
                          labelType: NavigationRailLabelType.all,
                          destinations: [
                            NavigationRailDestination(
                              icon: const Icon(Icons.person),
                              label: Text(l10n.profile),
                            ),
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
                ProfileScreen.route(),
              ],
            ),
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
                    SupportScreen.route(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
      redirect: _redirect,
    );
  }

  // ignore: unused_field
  final AuthNotifier _authNotifier;
  bool _isInitialized = false;

  @override
  late RouterConfig<Object> router;

  // final publicRoutes = [
  //   SignInScreen.path,
  //   '${SignInScreen.path}${SignUpScreen.path}',
  //   '${SignInScreen.path}${ForgotPasswordScreen.path}',
  // ];

  Future<void> _initialize(BuildContext context) async {
    if (!context.mounted) return;

    try {
      await Future.wait([
        context.read<PreferenceNotifier>().initialize(),
        context.read<AuthNotifier>().initialize(),

        // Min time native splash is shown
        Future.delayed(2500.ms, () {}),
      ]);
    } catch (e, s) {
      AppLogger.instance.error(e.toString(), stackTrace: s);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });

    _isInitialized = true;
  }

  FutureOr<String?> _redirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    if (!_isInitialized) {
      await _initialize(context);
    }

    // if (state.matchedLocation == SplashScreen.path) {
    //   return null;
    // }

    // if (!AppConstant.useAuth) return null;

    // final isAuthenticated = _authNotifier.isAuthenticated;

    // final isPublicRoute = publicRoutes.contains(state.matchedLocation);

    // if (!isAuthenticated && !isPublicRoute) {
    //   return SignInScreen.path;
    // }

    // if (isPublicRoute && isAuthenticated) {
    //   return HomeScreen.path;
    // }

    return null;
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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lune/core/ui/animations/animations.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/auth/ui/notifiers/notifiers.dart';
import 'package:lune/features/core/auth/ui/screens/sign_in/notifiers/notifiers.dart';
import 'package:lune/features/core/auth/ui/screens/sign_in/views/views.dart';
import 'package:provider/provider.dart';

class SignInScreen {
  const SignInScreen();

  static const path = '/sign-in';

  static GoRoute route({
    List<RouteBase> routes = const [],
  }) =>
      GoRoute(
        path: path,
        name: path,
        pageBuilder: (context, state) {
          return RouteAnimation.slideUpToDownTransition(
            key: state.pageKey,
            curve: Curves.elasticInOut,
            duration: const Duration(milliseconds: 1000),
            child: ChangeNotifierProvider(
              create: (context) => SignInNotifier(
                signInWithEmailPasswordUseCase: Injector.findSingleton(),
                onSignInSuccess: (session) {
                  context.read<AuthNotifier>().setSession(session);
                },
                snackbar: Injector.findSingleton(),
                localization: Injector.findSingleton(),
                router: Injector.findSingleton(),
              ),
              child: const SignInPage(),
            ),
          );
        },
        routes: routes,
      );
}

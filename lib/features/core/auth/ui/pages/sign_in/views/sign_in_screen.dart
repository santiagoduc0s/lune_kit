import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lune/features/sign_in/bloc/bloc.dart';
import 'package:lune/features/sign_in/views/views.dart';
import 'package:lune/helpers/helpers.dart';

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
            child: BlocProvider(
              create: (context) => SignInBloc(
                authRepository: Injector.get(),
              ),
              child: const SignInPage(),
            ),
          );
        },
        routes: routes,
      );
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lune/features/forgot_password/bloc/bloc.dart';
import 'package:lune/features/forgot_password/views/views.dart';
import 'package:lune/helpers/helpers.dart';

class ForgotPasswordScreen {
  const ForgotPasswordScreen();

  static const path = '/forgot-password';

  static GoRoute route({
    List<RouteBase> routes = const [],
  }) =>
      GoRoute(
        path: path,
        name: path,
        builder: (context, state) {
          final email = state.uri.queryParameters['email'] ?? '';

          return BlocProvider(
            create: (context) => ForgotPasswordBloc(
              authRepository: Injector.get(),
            )..add(ForgotPasswordInit(initialEmail: email)),
            child: const ForgotPasswordPage(),
          );
        },
        routes: routes,
      );
}

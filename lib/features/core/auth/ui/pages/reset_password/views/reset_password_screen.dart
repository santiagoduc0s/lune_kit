import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lune/features/reset_password/bloc/bloc.dart';
import 'package:lune/features/reset_password/views/views.dart';
import 'package:lune/helpers/helpers.dart';

class ResetPasswordScreen {
  const ResetPasswordScreen();

  static const path = '/reset-password';

  static GoRoute route({
    List<RouteBase> routes = const [],
  }) =>
      GoRoute(
        path: path,
        name: path,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => ResetPasswordBloc(
              authRepository: Injector.get(),
            ),
            child: const ResetPasswordPage(),
          );
        },
        routes: routes,
      );
}

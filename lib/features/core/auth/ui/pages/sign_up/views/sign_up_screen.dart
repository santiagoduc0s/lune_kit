import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lune/features/sign_up/bloc/bloc.dart';
import 'package:lune/features/sign_up/views/sign_up_page.dart';
import 'package:lune/helpers/injector.dart';

class SignUpScreen {
  const SignUpScreen();

  static const path = '/sign-up';

  static GoRoute route({
    List<RouteBase> routes = const [],
  }) =>
      GoRoute(
        path: path,
        name: path,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => SignUpBloc(
              authRepository: Injector.get(),
            ),
            child: const SignUpPage(),
          );
        },
        routes: routes,
      );
}

import 'package:go_router/go_router.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/auth/ui/pages/sign_up/notifiers/notifiers.dart';
import 'package:lune/features/core/auth/ui/pages/sign_up/views/views.dart';
import 'package:provider/provider.dart';

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
          return ChangeNotifierProvider(
            create: (context) => SignUpNotifier(
              signUpUseCase: Injector.findSingleton(),
              router: Injector.findSingleton(),
              localization: Injector.findSingleton(),
              snackbar: Injector.findSingleton(),
            ),
            child: const SignUpPage(),
          );
        },
        routes: routes,
      );
}

import 'package:go_router/go_router.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/auth/ui/screens/forgot_password/notifiers/notifiers.dart';
import 'package:lune/features/core/auth/ui/screens/forgot_password/views/views.dart';
import 'package:provider/provider.dart';

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

          return ChangeNotifierProvider(
            create: (context) => ForgotPasswordNotifier(
              forgotPasswordUseCase: Injector.findSingleton(),
              snackbar: Injector.findSingleton(),
              localization: Injector.findSingleton(),
              router: Injector.findSingleton(),
            )..init(email),
            child: const ForgotPasswordPage(),
          );
        },
        routes: routes,
      );
}

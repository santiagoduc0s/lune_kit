import 'package:go_router/go_router.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/auth/ui/notifiers/notifiers.dart';
import 'package:lune/features/core/auth/ui/pages/reset_password/notifiers/notifiers.dart';
import 'package:lune/features/core/auth/ui/pages/reset_password/views/views.dart';
import 'package:provider/provider.dart';

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
          return ChangeNotifierProvider(
            create: (context) => ResetPasswordNotifier(
              signInWithEmailPasswordUseCase: Injector.findSingleton(),
              updatePasswordUseCase: Injector.findSingleton(),
              user: context.read<AuthNotifier>().session!.user,
              localization: Injector.findSingleton(),
              snackbar: Injector.findSingleton(),
              router: Injector.findSingleton(),
            ),
            child: const ResetPasswordPage(),
          );
        },
        routes: routes,
      );
}

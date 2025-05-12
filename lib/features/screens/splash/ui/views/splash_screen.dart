import 'package:go_router/go_router.dart';
import 'package:lune/core/ui/animations/animations.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/auth/ui/notifiers/notifiers.dart';
import 'package:lune/features/screens/splash/ui/notifiers/notifiers.dart';
import 'package:lune/features/screens/splash/ui/views/views.dart';
import 'package:provider/provider.dart';

class SplashScreen {
  const SplashScreen();

  static const path = '/splash';

  static GoRoute route({
    List<RouteBase> routes = const [],
  }) {
    return GoRoute(
      path: path,
      name: path,
      pageBuilder: (context, state) {
        final authNotifier = context.read<AuthNotifier>();

        return RouteAnimation.noAnimationTransition(
          key: state.pageKey,
          child: ChangeNotifierProvider<SplashNotifier>(
            lazy: false,
            create: (context) => SplashNotifier(
              getPublicOnboardStatusUseCase: Injector.findSingleton(),
              appRouter: Injector.findSingleton(),
            )..initialize(isLoggedIn: authNotifier.isLoggedIn),
            child: const SplashPage(),
          ),
        );
      },
      routes: routes,
    );
  }
}

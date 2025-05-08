import 'package:go_router/go_router.dart';
import 'package:lune/core/ui/animations/animations.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/pages/splash/ui/notifiers/notifiers.dart';
import 'package:lune/features/pages/splash/ui/views/views.dart';
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
        return RouteAnimation.noAnimationTransition(
          key: state.pageKey,
          child: ChangeNotifierProvider<SplashNotifier>(
            lazy: false,
            create: (context) => SplashNotifier(
              getPublicOnboardStatusUseCase: Injector.findSingleton(),
              appRouter: Injector.findSingleton(),
            )..initialize(),
            child: const SplashPage(),
          ),
        );
      },
      routes: routes,
    );
  }
}

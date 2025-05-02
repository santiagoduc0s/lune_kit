import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lune/core/ui/animations/animations.dart';
import 'package:lune/features/pages/splash/bloc/bloc.dart';
import 'package:lune/features/pages/splash/views/views.dart';

class SplashScreen {
  const SplashScreen();

  static const path = '/splash';

  static GoRoute route({
    List<RouteBase> routes = const [],
  }) =>
      GoRoute(
        path: path,
        name: path,
        pageBuilder: (context, state) {
          return RouteAnimation.noAnimationTransition(
            key: state.pageKey,
            child: BlocProvider(
              lazy: false,
              create: (context) => SplashBloc()..add(SplashInit()),
              child: const SplashPage(),
            ),
          );
        },
        routes: routes,
      );
}

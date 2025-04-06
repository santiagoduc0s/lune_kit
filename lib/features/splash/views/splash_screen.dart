import 'package:core/core.dart';
import 'package:example/features/splash/bloc/bloc.dart';
import 'package:example/features/splash/views/views.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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

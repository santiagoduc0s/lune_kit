import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lune/core/ui/animations/route_animation.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/pages/public_onboard/public_onboard.dart';
import 'package:provider/provider.dart';

class PublicOnboardScreen {
  const PublicOnboardScreen();

  static const path = '/public-onboard';

  static GoRoute route({
    List<RouteBase> routes = const [],
  }) =>
      GoRoute(
        path: path,
        name: path,
        pageBuilder: (context, state) {
          return RouteAnimation.slideDownToUpTransition(
            duration: const Duration(milliseconds: 1500),
            key: state.pageKey,
            child: ChangeNotifierProvider<PublicOnboardNotifier>(
              create: (_) => Injector.findSingleton(),
              child: const PublicOnboardPage(),
            ),
            curve: Curves.elasticInOut,
          );
        },
        routes: routes,
      );
}

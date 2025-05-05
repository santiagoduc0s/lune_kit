import 'package:go_router/go_router.dart';
import 'package:lune/features/pages/settings/ui/views/views.dart';

class SettingsScreen {
  const SettingsScreen();

  static const path = '/settings';

  static GoRoute route({
    List<RouteBase> routes = const [],
  }) =>
      GoRoute(
        path: path,
        name: path,
        builder: (context, state) {
          return const SettingsPage();
        },
        routes: routes,
      );
}

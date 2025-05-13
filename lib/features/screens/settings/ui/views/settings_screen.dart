import 'package:go_router/go_router.dart';
import 'package:lune/features/core/auth/auth.dart';
import 'package:lune/features/screens/settings/ui/notifiers/notifiers.dart';
import 'package:lune/features/screens/settings/ui/views/views.dart';
import 'package:provider/provider.dart';

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
          return ChangeNotifierProvider(
            create: (context) => SettingsNotifier(
              onSignOut: () {
                context.read<AuthNotifier>().signOut();
              },
            ),
            child: const SettingsPage(),
          );
        },
        routes: routes,
      );
}

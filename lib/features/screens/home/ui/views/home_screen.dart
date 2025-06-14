import 'package:go_router/go_router.dart';
import 'package:lune/features/screens/home/ui/views/views.dart';

class HomeScreen {
  const HomeScreen();

  static const path = '/home';

  static GoRoute route({
    List<RouteBase> routes = const [],
  }) =>
      GoRoute(
        path: path,
        name: path,
        builder: (context, state) {
          return const HomePage();
        },
        routes: routes,
      );
}

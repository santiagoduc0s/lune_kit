import 'package:go_router/go_router.dart';
import 'package:lune/features/screens/terms_conditions/ui/views/views.dart';

class TermsConditionsScreen {
  const TermsConditionsScreen();

  static const path = '/terms-conditions';

  static GoRoute route({
    List<RouteBase> routes = const [],
  }) =>
      GoRoute(
        path: path,
        name: path,
        builder: (context, state) {
          return const TermsConditionsPage();
        },
        routes: routes,
      );
}

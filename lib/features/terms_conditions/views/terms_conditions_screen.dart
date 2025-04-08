import 'package:example/features/terms_conditions/views/views.dart';
import 'package:go_router/go_router.dart';

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

import 'package:lune/features/privacy_policy/views/views.dart';
import 'package:go_router/go_router.dart';

class PrivacyPolicyScreen {
  const PrivacyPolicyScreen();

  static const path = '/privacy-policy';

  static GoRoute route({
    List<RouteBase> routes = const [],
  }) =>
      GoRoute(
        path: path,
        name: path,
        builder: (context, state) {
            return const PrivacyPolicyPage();
        },
        routes: routes,
      );
}

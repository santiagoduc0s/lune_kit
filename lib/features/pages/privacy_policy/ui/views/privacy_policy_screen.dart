import 'package:go_router/go_router.dart';
import 'package:lune/features/pages/privacy_policy/ui/views/views.dart';

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

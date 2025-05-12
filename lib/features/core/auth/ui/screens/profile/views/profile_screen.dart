import 'package:go_router/go_router.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/auth/ui/notifiers/notifiers.dart';
import 'package:lune/features/core/auth/ui/screens/profile/notifiers/notifiers.dart';
import 'package:lune/features/core/auth/ui/screens/profile/views/views.dart';
import 'package:provider/provider.dart';

class ProfileScreen {
  const ProfileScreen();

  static const path = '/profile';

  static GoRoute route({
    List<RouteBase> routes = const [],
  }) =>
      GoRoute(
        path: path,
        name: path,
        builder: (context, state) {
          final user = context.read<AuthNotifier>().session!.user;

          return ChangeNotifierProvider(
            create: (context) => ProfileNotifier(
              updateProfileUseCase: Injector.findSingleton(),
              user: user,
              snackbar: Injector.findSingleton(),
              localization: Injector.findSingleton(),
            )..init(),
            child: const ProfilePage(),
          );
        },
        routes: routes,
      );
}

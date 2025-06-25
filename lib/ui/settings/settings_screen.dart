import 'package:go_router/go_router.dart';
import 'package:lune/ui/auth/notifiers/notifiers.dart';
import 'package:lune/ui/settings/notifiers/notifiers.dart';
import 'package:lune/ui/settings/widgets/widgets.dart';
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
              authRepository: context.read(),
              onSignOut: () {
                context.read<AuthNotifier>().signOut();
              },
              checkPermissionUseCase: context.read(),
              requestPermissionUseCase: context.read(),
              openSettingsUseCase: context.read(),
              dialog: context.read(),
              snackbar: context.read(),
              localization: context.read(),
              saveTokenUseCase: context.read(),
              getDeviceUseCase: context.read(),
              router: context.read(),
              authNotifier: context.read(),
            )..initialize(),
            child: const SettingsPage(),
          );
        },
        routes: routes,
      );
}

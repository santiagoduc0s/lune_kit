import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lune/features/profile/bloc/bloc.dart';
import 'package:lune/features/profile/views/views.dart';
import 'package:lune/helpers/helpers.dart';
import 'package:lune/utils/utils.dart';

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
          final user = UserAuthSession.instance.user!;

          return BlocProvider(
            create: (context) => ProfileBloc(
              authRepository: Injector.get(),
              storageRepository: Injector.get(),
              imageUser: user.photo,
              initials: user.initials,
            )..init(),
            child: const ProfilePage(),
          );
        },
        routes: routes,
      );
}

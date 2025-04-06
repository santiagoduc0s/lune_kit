import 'package:example/features/home/bloc/bloc.dart';
import 'package:example/features/home/views/views.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
          return BlocProvider(
            create: (context) => HomeBloc(),
            child: const HomePage(),
          );
        },
        routes: routes,
      );
}

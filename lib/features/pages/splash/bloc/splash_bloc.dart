import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lune/config/router/app_router.dart';
import 'package:lune/features/pages/home/home.dart';
import 'package:lune/features/pages/splash/bloc/bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState.initial()) {
    on<SplashInit>(_onSplashInit);
  }

  Future<void> _onSplashInit(
    SplashInit event,
    Emitter<SplashState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 2), () {});

    AppRouter.instance.goNamed(HomeScreen.path);
  }
}

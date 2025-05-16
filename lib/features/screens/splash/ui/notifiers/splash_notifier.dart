import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lune/config/config.dart';
import 'package:lune/features/core/auth/ui/screens/sign_in/views/views.dart';
import 'package:lune/features/screens/home/home.dart';
import 'package:lune/features/screens/public_onboard/domain/enums/enums.dart';
import 'package:lune/features/screens/public_onboard/domain/usecases/usecases.dart';
import 'package:lune/features/screens/public_onboard/ui/views/views.dart';

class SplashNotifier extends ChangeNotifier {
  SplashNotifier({
    required this.getPublicOnboardStatusUseCase,
    required this.router,
  });

  final GetPublicOnboardStatusUseCase getPublicOnboardStatusUseCase;
  final CustomRouter router;

  Future<void> initialize({bool isLoggedIn = false}) async {
    // Simulate loading custom animation
    await Future.delayed(2600.ms, () {});

    if (AppConstant.publicOnBoardIsActive) {
      final e = await getPublicOnboardStatusUseCase.call();
      if (e.status == PublicOnboardStatusEnum.unseen) {
        return router.goNamed(PublicOnboardScreen.path);
      }
    }

    if (AppConstant.authIsActive) {
      if (isLoggedIn) {
        return router.goNamed(HomeScreen.path);
      } else {
        return router.goNamed(SignInScreen.path);
      }
    }

    router.goNamed(HomeScreen.path);
  }
}

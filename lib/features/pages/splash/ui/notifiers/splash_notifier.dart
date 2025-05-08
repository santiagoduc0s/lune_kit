import 'package:flutter/material.dart';
import 'package:lune/config/config.dart';
import 'package:lune/features/pages/home/home.dart';
import 'package:lune/features/pages/public_onboard/domain/enums/enums.dart';
import 'package:lune/features/pages/public_onboard/domain/usecases/usecases.dart';
import 'package:lune/features/pages/public_onboard/ui/views/views.dart';

class SplashNotifier extends ChangeNotifier {
  SplashNotifier({
    required this.getPublicOnboardStatusUseCase,
    required this.appRouter,
  });

  final GetPublicOnboardStatusUseCase getPublicOnboardStatusUseCase;
  final AppRouter appRouter;

  Future<void> initialize() async {
    // Simulate loading custom animation
    await Future.delayed(const Duration(seconds: 2), () {});

    if (AppConstant.publicOnBoard) {
      final e = await getPublicOnboardStatusUseCase.call();
      if (e.status == PublicOnboardStatusEnum.unseen) {
        return appRouter.goNamed(PublicOnboardScreen.path);
      }
    }

    appRouter.goNamed(HomeScreen.path);
  }
}

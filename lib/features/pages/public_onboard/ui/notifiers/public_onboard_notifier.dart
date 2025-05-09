import 'package:flutter/material.dart';
import 'package:lune/config/config.dart';
import 'package:lune/core/ui/alerts/snackbar/snackbar.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/pages/home/ui/views/views.dart';
import 'package:lune/features/pages/public_onboard/domain/entities/entities.dart';
import 'package:lune/features/pages/public_onboard/domain/enums/enums.dart';
import 'package:lune/features/pages/public_onboard/domain/usecases/usecases.dart';

class PublicOnboardNotifier extends ChangeNotifier {
  PublicOnboardNotifier({
    required this.setStatusUseCase,
    required this.getStatusUseCase,
    required this.router,
    required this.snackbar,
    required this.localization,
  });

  SetPublicOnboardStatusUseCase setStatusUseCase;
  GetPublicOnboardStatusUseCase getStatusUseCase;

  AppRouter router;
  AppSnackbar snackbar;
  Localization localization;

  late PublicOnboardStatusEnum status;

  bool isLoading = false;

  Future<void> initialize() async {
    status = (await getStatusUseCase.call()).status;
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> finishOnboard() async {
    _setLoading(true);

    try {
      await setStatusUseCase.call(
        PublicOnboardStatusEntity(
          status: PublicOnboardStatusEnum.seen,
        ),
      );
      router.goNamed(HomeScreen.path);
    } catch (e) {
      snackbar.show(
        (context) => Snackbars.error(
          context,
          text: localization.tr.generalError,
        ),
      );
    } finally {
      _setLoading(false);
    }
  }
}

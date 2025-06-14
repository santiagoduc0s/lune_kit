import 'package:flutter/material.dart';
import 'package:lune/config/config.dart';
import 'package:lune/core/extensions/extensions.dart';
import 'package:lune/core/ui/alerts/snackbar/snackbar.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/screens/home/ui/views/views.dart';
import 'package:lune/features/screens/public_onboard/domain/entities/entities.dart';
import 'package:lune/features/screens/public_onboard/domain/enums/enums.dart';
import 'package:lune/features/screens/public_onboard/domain/usecases/usecases.dart';

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

  CustomRouter router;
  CustomSnackbar snackbar;
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
    } catch (e, s) {
      errorSnackbar(snackbar, localization.tr.generalError);
      logError(e, s);
    } finally {
      _setLoading(false);
    }
  }
}

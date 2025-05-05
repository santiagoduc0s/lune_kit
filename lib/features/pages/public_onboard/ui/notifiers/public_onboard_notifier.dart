import 'package:flutter/material.dart';
import 'package:lune/config/config.dart';
import 'package:lune/core/ui/alerts/snackbar/snackbar.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/pages/home/ui/pages/views.dart';
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
    status = await getStatusUseCase.call();
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> finishOnboard() async {
    _setLoading(true);

    try {
      status = PublicOnboardStatusEnum.seen;
      await setStatusUseCase.call(status);
      router.goNamed(HomeScreen.path);
    } catch (e) {
      snackbar.show(
        snackbar: (context) => Snackbars.error(
          context,
          text: localization.tr.generalError,
        ),
      );
    } finally {
      _setLoading(false);
    }
  }
}

import 'package:flutter/foundation.dart';
import 'package:lune/config/router/router.dart';
import 'package:lune/core/exceptions/exceptions.dart';
import 'package:lune/core/extensions/extensions.dart';
import 'package:lune/core/form/validators/validators.dart';
import 'package:lune/core/ui/alerts/snackbar/snackbar.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/auth/domain/entities/entities.dart';
import 'package:lune/features/core/auth/domain/exceptions/exceptions.dart';
import 'package:lune/features/core/auth/domain/usecases/usecases.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ResetPasswordNotifier extends ChangeNotifier {
  ResetPasswordNotifier({
    required this.signInWithEmailPasswordUseCase,
    required this.updatePasswordUseCase,
    required this.user,
    required this.snackbar,
    required this.localization,
    required this.router,
  });

  final SignInWithEmailPasswordUseCase signInWithEmailPasswordUseCase;
  final UpdatePasswordUseCase updatePasswordUseCase;
  final UserEntity user;
  final AppSnackbar snackbar;
  final Localization localization;
  final AppRouter router;

  final FormGroup form = FormGroup(
    {
      'password': FormControl<String>(
        value: '',
        validators: [
          Validators.required,
          Validators.minLength(8),
        ],
      ),
      'newPassword': FormControl<String>(
        value: '',
        validators: [
          Validators.required,
          Validators.minLength(8),
        ],
      ),
      'repeatPassword': FormControl<String>(
        value: '',
        validators: [Validators.required],
      ),
    },
    validators: [
      CustomMustMatchValidator(
        controlName: 'newPassword',
        matchingControlName: 'repeatPassword',
      ),
    ],
  );

  bool _isResetting = false;
  bool get isResetting => _isResetting;
  void setIsResetting(bool value) {
    _isResetting = value;
    notifyListeners();
  }

  Future<void> resetPassword() async {
    if (!form.valid) {
      form.markAllAsTouched();
      return;
    }

    if (_isResetting) return;

    setIsResetting(true);

    try {
      await signInWithEmailPasswordUseCase.call(
        email: user.email!,
        password: form.control('password').value as String,
      );

      await updatePasswordUseCase.call(
        form.control('newPassword').value as String,
      );

      primarySnackbar(
        snackbar,
        localization.tr.settings_passwordUpdated,
      );

      router.pop();
    } on InvalidCredentialException {
      errorSnackbar(
        snackbar,
        localization.tr.signIn_invalidCredential,
      );
    } on NoInternetConnectionException {
      errorSnackbar(
        snackbar,
        localization.tr.notConnected,
      );
    } catch (e, s) {
      errorSnackbar(
        snackbar,
        localization.tr.generalError,
      );

      logError(e, s);
    } finally {
      setIsResetting(false);
    }
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }
}

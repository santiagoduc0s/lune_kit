import 'package:flutter/foundation.dart';
import 'package:lune/config/router/router.dart';
import 'package:lune/core/extensions/extensions.dart';
import 'package:lune/core/ui/alerts/snackbar/snackbar.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/auth/domain/usecases/usecases.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ForgotPasswordNotifier extends ChangeNotifier {
  ForgotPasswordNotifier({
    required this.forgotPasswordUseCase,
    required this.snackbar,
    required this.localization,
    required this.router,
  });

  final ForgotPasswordUseCase forgotPasswordUseCase;
  final AppSnackbar snackbar;
  final Localization localization;
  final AppRouter router;

  late final FormGroup form;

  bool isSendingEmail = false;

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }

  void _setupForm() {
    form = FormGroup({
      'email': FormControl<String>(
        value: '',
        validators: [Validators.required, Validators.email],
      ),
    });
  }

  void setIsSendingEmail(bool value) {
    isSendingEmail = value;
    notifyListeners();
  }

  void init(String? initialEmail) {
    _setupForm();

    if (initialEmail != null && initialEmail.isNotEmpty) {
      form.control('email').value = initialEmail;
    }
  }

  Future<void> sendForgotPasswordEmail() async {
    if (isSendingEmail) return;

    if (!form.valid) {
      form.markAllAsTouched();
      return;
    }

    setIsSendingEmail(true);

    try {
      final email = form.control('email').value as String;
      await forgotPasswordUseCase.call(email: email);

      snackbar.show(
        (ctx) => Snackbars.primary(
          ctx,
          text: localization.tr.forgotPassword_emailSent,
        ),
      );

      router.pop(email);
    } catch (e, s) {
      snackbar.show(
        (ctx) => Snackbars.error(
          ctx,
          text: localization.tr.generalError,
        ),
      );

      logError(e, s);
    } finally {
      setIsSendingEmail(false);
    }
  }
}

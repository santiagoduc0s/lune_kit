import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lune/config/router/router.dart';
import 'package:lune/core/extensions/extensions.dart';
import 'package:lune/core/form/validators/validators.dart';
import 'package:lune/core/ui/alerts/snackbar/snackbar.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/auth/domain/exceptions/exceptions.dart';
import 'package:lune/features/core/auth/domain/usecases/usecases.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignUpNotifier extends ChangeNotifier {
  SignUpNotifier({
    required this.signUpUseCase,
    required this.router,
    required this.snackbar,
    required this.localization,
  });

  final SignUpUseCase signUpUseCase;
  final AppRouter router;
  final AppSnackbar snackbar;
  final Localization localization;
  bool isSigningUp = false;

  final form = FormGroup(
    {
      'photo': FormControl<XFile?>(),
      'firstName': FormControl<String>(
        value: '',
        validators: [Validators.required],
      ),
      'lastName': FormControl<String>(
        value: '',
        validators: [Validators.required],
      ),
      'email': FormControl<String>(
        value: '',
        validators: [Validators.required, Validators.email],
      ),
      'password': FormControl<String>(
        value: '',
        validators: [Validators.required, Validators.minLength(8)],
      ),
      'repeatPassword': FormControl<String>(
        value: '',
        validators: [Validators.required],
      ),
    },
    validators: [
      CustomMustMatchValidator(
        controlName: 'password',
        matchingControlName: 'repeatPassword',
      ),
    ],
  );

  Future<void> signUp() async {
    if (!form.valid) {
      form.markAllAsTouched();
      return;
    }

    if (isSigningUp) return;

    _setSigningUp(true);

    try {
      // storage repo
      final photo = form.control('photo').value as XFile?;

      await signUpUseCase.call(
        email: form.control('email').value as String,
        password: form.control('password').value as String,
        firstName: form.control('firstName').value as String,
        lastName: form.control('lastName').value as String,
        photo: photo?.path,
      );

      router.pop({
        'email': form.control('email').value as String,
        'password': form.control('password').value as String,
      });
    } on EmailAlreadyInUseException {
      errorSnackbar(snackbar, localization.tr.signUp_emailAlreadyInUse);
    } on WeakPasswordException {
      errorSnackbar(snackbar, localization.tr.signUp_weakPassword);
    } on InvalidEmailFormatException {
      errorSnackbar(snackbar, localization.tr.signUp_InvalidEmailFormat);
    } catch (e, s) {
      errorSnackbar(snackbar, localization.tr.generalError);
      logError(e, s);
    } finally {
      _setSigningUp(false);
    }
  }

  void _setSigningUp(bool value) {
    isSigningUp = value;
    notifyListeners();
  }
}

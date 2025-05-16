import 'package:flutter/material.dart';
import 'package:lune/config/router/router.dart';
import 'package:lune/core/exceptions/exceptions.dart';
import 'package:lune/core/extensions/extensions.dart';
import 'package:lune/core/ui/alerts/snackbar/snackbar.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/auth/domain/entities/entities.dart';
import 'package:lune/features/core/auth/domain/exceptions/exceptions.dart';
import 'package:lune/features/core/auth/domain/usecases/usecases.dart';
import 'package:lune/features/core/auth/ui/screens/forgot_password/views/views.dart';
import 'package:lune/features/core/auth/ui/screens/sign_up/views/views.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignInNotifier extends ChangeNotifier {
  SignInNotifier({
    required this.signInWithEmailPasswordUseCase,
    required this.onSignInSuccess,
    required this.snackbar,
    required this.localization,
    required this.router,
  });

  final SignInWithEmailPasswordUseCase signInWithEmailPasswordUseCase;
  final void Function(AuthSessionEntity session) onSignInSuccess;
  final AppSnackbar snackbar;
  final Localization localization;
  final CustomRouter router;

  final FormGroup form = FormGroup({
    'email': FormControl<String>(
      value: '',
      validators: [Validators.required, Validators.email],
    ),
    'password': FormControl<String>(
      value: '',
      validators: [Validators.required, Validators.minLength(8)],
    ),
  });

  bool isSigningIn = false;

  Future<void> signInWithEmailAndPassword() async {
    if (!form.valid) {
      form.markAllAsTouched();
      return;
    }

    if (isSigningIn) return;

    _setSigningIn(true);
    try {
      final credentials = await signInWithEmailPasswordUseCase.call(
        email: form.control('email').value as String,
        password: form.control('password').value as String,
      );

      onSignInSuccess(credentials);

      router.refresh();
    } on EmailDoesNotVerifiedException {
      errorSnackbar(
        snackbar,
        localization.tr.signIn_emailDoesNotVerified,
      );
    } on InvalidCredentialException {
      errorSnackbar(
        snackbar,
        localization.tr.signIn_invalidCredential,
      );
    } on WrongPasswordException {
      errorSnackbar(
        snackbar,
        localization.tr.signIn_wrongPassword,
      );
    } on UserDisabledException {
      errorSnackbar(
        snackbar,
        localization.tr.signIn_userDisabled,
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
      _setSigningIn(false);
    }
  }

  Future<void> goToSignUp() async {
    final result = await router.pushNamed<Map<String, String>>(
      SignUpScreen.path,
    );

    if (result == null) return;

    form.control('email').value = result['email'];
    form.control('password').value = result['password'];

    /// If the user should validate the email
    // primarySnackbar(
    //   snackbar,
    //   localization.tr.signIn_emailValidationSent,
    // );
  }

  Future<void> goToForgotPassword() async {
    final email = await router.pushNamed<String>(
      ForgotPasswordScreen.path,
      queryParameters: {
        'email': form.control('email').value as String,
      },
    );

    if (email == null) return;

    form.control('email').value = email;
  }

  void _setSigningIn(bool value) {
    isSigningIn = value;
    notifyListeners();
  }
}

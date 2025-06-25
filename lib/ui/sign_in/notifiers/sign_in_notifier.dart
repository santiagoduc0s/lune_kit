import 'package:flutter/material.dart';
import 'package:lune/core/exceptions/exceptions.dart';
import 'package:lune/core/extensions/extensions.dart';
import 'package:lune/core/ui/alerts/snackbar/snackbar.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/domain/entities/entities.dart';
import 'package:lune/domain/repositories/repositories.dart';
import 'package:lune/domain/usecases/auth/auth.dart';
import 'package:lune/router/router.dart';
import 'package:lune/ui/forgot_password/widgets/views.dart';
import 'package:lune/ui/sign_up/widgets/views.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignInNotifier extends ChangeNotifier {
  SignInNotifier({
    required this.signInWithEmailPasswordUseCase,
    required this.authRepository,
    required this.snackbar,
    required this.localization,
    required this.router,
    required this.onSignInSuccess,
  });

  final SignInWithEmailPasswordUseCase signInWithEmailPasswordUseCase;
  final AuthRepository authRepository;
  final CustomSnackbar snackbar;
  final Localization localization;
  final CustomRouter router;
  final void Function(UserEntity user) onSignInSuccess;

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
      await signInWithEmailPasswordUseCase.call(
        email: form.control('email').value as String,
        password: form.control('password').value as String,
      );

      final user = await authRepository.currentUser();

      onSignInSuccess(user!);

      router.pop();
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

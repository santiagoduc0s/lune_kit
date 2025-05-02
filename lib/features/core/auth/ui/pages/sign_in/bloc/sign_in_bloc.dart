import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lune/application/auth/repositories/repositories.dart';
import 'package:lune/domain/auth/exceptions/exceptions.dart';
import 'package:lune/domain/auth/requests/requests.dart';
import 'package:lune/features/forgot_password/forgot_password.dart';
import 'package:lune/features/sign_in/bloc/bloc.dart';
import 'package:lune/features/sign_up/views/views.dart';
import 'package:lune/helpers/alerts/alerts.dart';
import 'package:lune/router/router.dart';
import 'package:lune/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required this.authRepository,
  }) : super(const SignInState.initial()) {
    on<SignInWithEmailAndPassword>(_onLoginWithEmailAndPassword);
    on<SignUpAccount>(_onSignUpAccount);
    on<ForgotPassword>(_onForgotPassword);
  }

  final AuthRepository authRepository;

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

  Future<void> _onLoginWithEmailAndPassword(
    SignInWithEmailAndPassword event,
    Emitter<SignInState> emit,
  ) async {
    if (!form.valid) {
      form.markAllAsTouched();
      return;
    }

    if (state.isSingingWithEmailAndPassword) return;

    emit(state.copyWith(isSingingWithEmailAndPassword: true));

    try {
      UserAuthSession.instance.setUserCredential(
        await authRepository.signInWithEmailAndPassword(
          SignInWithEmailAndPasswordRequestBody(
            email: form.control('email').value as String,
            password: form.control('password').value as String,
          ),
        ),
      );

      /// If the user was created with email and password means the user
      /// used the register form, therefore, we don't need to check if
      /// exist in the database
      final user = await authRepository.getUser();

      UserAuthSession.instance.setUser(user);

      AppRouter.instance.refresh();
    } on EmailDoesNotVerifiedException {
      CustomSnackbar.instance.info(
        text: Localization.instance.tr.signIn_emailDoesNotVerified,
      );
      await authRepository.signOut();
    } on InvalidCredentialException {
      CustomSnackbar.instance.error(
        text: Localization.instance.tr.signIn_invalidCredential,
      );
    } on WrongPasswordException {
      CustomSnackbar.instance.error(
        text: Localization.instance.tr.signIn_wrongPassword,
      );
    } on UserDisabledException {
      CustomSnackbar.instance.error(
        text: Localization.instance.tr.signIn_userDisabled,
      );
    } on UserNotFound {
      AppLogger.instance.error(
        'Not found user (FAILED REGISTRATION OR UNSUCCESSFUL DELETE)',
      );

      rethrow;
    } on PermissionDeniedUsers catch (e, s) {
      CustomSnackbar.instance.error(
        text: Localization.instance.tr.contactSupport,
      );

      AppLogger.instance.error(
        e.toString(),
        stackTrace: s,
      );
    } catch (e, s) {
      CustomSnackbar.instance.error(
        text: Localization.instance.tr.generalError,
      );

      AppLogger.instance.error(
        e.toString(),
        stackTrace: s,
      );
    } finally {
      emit(state.copyWith(isSingingWithEmailAndPassword: false));
    }
  }

  Future<void> _onSignUpAccount(
    SignUpAccount event,
    Emitter<SignInState> emit,
  ) async {
    final value = await AppRouter.instance
        .pushNamed<Map<String, String>>(SignUpScreen.path);

    if (value == null) return;

    form.control('email').value = value['email'];
    form.control('password').value = value['password'];

    CustomSnackbar.instance
        .info(text: Localization.instance.tr.signIn_emailValidationSent);
  }

  Future<void> _onForgotPassword(
    ForgotPassword event,
    Emitter<SignInState> emit,
  ) async {
    final email = await AppRouter.instance.pushNamed<String>(
      ForgotPasswordScreen.path,
      queryParameters: {
        'email': form.control('email').value as String,
      },
    );

    if (email == null) return;

    form.control('email').value = email;
  }
}

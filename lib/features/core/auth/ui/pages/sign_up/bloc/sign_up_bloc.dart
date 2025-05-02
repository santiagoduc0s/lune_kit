import 'dart:async';

import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lune/application/auth/repositories/repositories.dart';
import 'package:lune/domain/auth/exceptions/exceptions.dart';
import 'package:lune/domain/auth/requests/requests.dart';
import 'package:lune/features/sign_up/bloc/bloc.dart';
import 'package:lune/helpers/alerts/alerts.dart';
import 'package:lune/helpers/form/form.dart';
import 'package:lune/router/router.dart';
import 'package:lune/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required this.authRepository,
  }) : super(const SignUpState.initial()) {
    on<SignUpWithEmailAndPassword>(_onSignUpWithEmailAndPassword);
  }

  final AuthRepository authRepository;

  final FormGroup form = FormGroup(
    {
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

  Future<void> _onSignUpWithEmailAndPassword(
    SignUpWithEmailAndPassword event,
    Emitter<SignUpState> emit,
  ) async {
    if (!form.valid) {
      form.markAllAsTouched();
      return;
    }

    if (state.isSigningUp) return;

    emit(state.copyWith(isSigningUp: true));

    try {
      final userCredential = await authRepository.signUpWithEmailAndPassword(
        SignUpWithEmailAndPasswordRequestBody(
          email: form.control('email').value as String,
          password: form.control('password').value as String,
        ),
      );

      await authRepository.storeUser(
        StoreUserRequestBody(
          id: userCredential.extraData['id'] as String?,
          firstName: form.control('firstName').value as String,
          lastName: form.control('lastName').value as String,
          email: form.control('email').value as String,
        ),
      );

      AppRouter.instance.pop({
        'email': form.control('email').value as String,
        'password': form.control('password').value as String,
      });
    } on EmailAlreadyInUseException {
      CustomSnackbar.instance.info(
        text: Localization.instance.tr.signUp_emailAlreadyInUse,
      );
    } on WeakPasswordException {
      CustomSnackbar.instance.info(
        text: Localization.instance.tr.signUp_weakPassword,
      );
    } on InvalidEmailFormatException {
      CustomSnackbar.instance.info(
        text: Localization.instance.tr.signUp_InvalidEmailFormat,
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
      emit(state.copyWith(isSigningUp: false));
    }
  }
}

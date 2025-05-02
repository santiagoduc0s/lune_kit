import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lune/application/auth/repositories/repositories.dart';
import 'package:lune/domain/auth/exceptions/exceptions.dart';
import 'package:lune/domain/auth/requests/requests.dart';
import 'package:lune/features/reset_password/bloc/bloc.dart';
import 'package:lune/helpers/helpers.dart';
import 'package:lune/router/router.dart';
import 'package:lune/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc({
    required this.authRepository,
  }) : super(const ResetPasswordState.initial()) {
    on<SubmitResetPassword>(_onSubmitResetPassword);
  }

  final AuthRepository authRepository;

  final FormGroup form = FormGroup(
    {
      'password': FormControl<String>(
        value: '',
        validators: [Validators.required, Validators.minLength(8)],
      ),
      'newPassword': FormControl<String>(
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
        controlName: 'newPassword',
        matchingControlName: 'repeatPassword',
      ),
    ],
  );

  Future<void> _onSubmitResetPassword(
    SubmitResetPassword event,
    Emitter<ResetPasswordState> emit,
  ) async {
    if (!form.valid) {
      form.markAllAsTouched();
      return;
    }

    if (state.isResetPassword) return;

    emit(state.copyWith(isResetPassword: true));

    try {
      final user = UserAuthSession.instance.user!;

      await authRepository.signInWithEmailAndPassword(
        SignInWithEmailAndPasswordRequestBody(
          email: user.email!,
          password: form.control('password').value as String,
        ),
      );

      await authRepository.updatePassword(
        UpdatePasswordRequestBody(
          password: form.control('newPassword').value as String,
        ),
      );

      CustomSnackbar.instance.info(
        text: Localization.instance.tr.settings_passwordUpdated,
      );

      AppRouter.instance.pop();
    } on InvalidCredentialException {
      CustomSnackbar.instance.error(
        text: Localization.instance.tr.settings_checkPassword,
      );
    } catch (e, s) {
      CustomSnackbar.instance.error(
        text: Localization.instance.tr.generalError,
      );

      AppLogger.instance.error(e.toString(), stackTrace: s);
    } finally {
      emit(state.copyWith(isResetPassword: false));
    }
  }
}

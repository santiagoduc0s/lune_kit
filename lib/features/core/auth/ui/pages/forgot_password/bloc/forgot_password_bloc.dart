import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lune/application/auth/repositories/repositories.dart';
import 'package:lune/domain/auth/requests/requests.dart';
import 'package:lune/features/forgot_password/bloc/bloc.dart';
import 'package:lune/helpers/helpers.dart';
import 'package:lune/router/router.dart';
import 'package:lune/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc({
    required this.authRepository,
  }) : super(const ForgotPasswordState.initial()) {
    on<ForgotPasswordInit>(_onForgotPasswordInit);
    on<SendForgotPasswordEmail>(_onSendForgotPasswordEmail);
  }

  final AuthRepository authRepository;

  final FormGroup form = FormGroup(
    {
      'email': FormControl<String>(
        value: '',
        validators: [Validators.required, Validators.email],
      ),
    },
  );

  Future<void> _onForgotPasswordInit(
    ForgotPasswordInit event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    form.control('email').value = event.initialEmail;
  }

  Future<void> _onSendForgotPasswordEmail(
    SendForgotPasswordEmail event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    if (!form.valid) {
      form.markAllAsTouched();
      return;
    }

    if (state.isSendingEmail) return;

    emit(state.copyWith(isSendingEmail: true));

    try {
      await authRepository.sendEmailToResetPassword(
        SendEmailToResetPasswordRequestBody(
          email: form.control('email').value as String,
        ),
      );

      CustomSnackbar.instance.info(
        text: Localization.instance.tr.forgotPassword_emailSent,
      );

      AppRouter.instance.pop(form.control('email').value);
    } catch (e, s) {
      CustomSnackbar.instance.error(
        text: Localization.instance.tr.generalError,
      );

      AppLogger.instance.error(e.toString(), stackTrace: s);
    } finally {
      emit(state.copyWith(isSendingEmail: false));
    }
  }
}

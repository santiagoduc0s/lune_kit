import 'package:flutter/foundation.dart';
import 'package:lune/core/extensions/change_notifier_extension.dart';
import 'package:lune/core/ui/alerts/snackbar/snackbar.dart';
import 'package:lune/core/ui/ui.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/auth/domain/entities/entities.dart';
import 'package:lune/features/core/auth/domain/enums/enums.dart';
import 'package:lune/features/core/auth/domain/usecases/usecases.dart';

class AuthNotifier extends ChangeNotifier {
  AuthNotifier({
    required this.deleteUserUseCase,
    required this.forgotPasswordUseCase,
    required this.signInWithCredentialsUseCase,
    required this.signInWithEmailPasswordUseCase,
    required this.signOutUseCase,
    required this.signUpUseCase,
    required this.updatePasswordUseCase,
    required this.localization,
    required this.snackbar,
  });

  final DeleteUserUseCase deleteUserUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final SignInWithCredentialsUseCase signInWithCredentialsUseCase;
  final SignInWithEmailPasswordUseCase signInWithEmailPasswordUseCase;
  final SignOutUseCase signOutUseCase;
  final SignUpUseCase signUpUseCase;
  final UpdatePasswordUseCase updatePasswordUseCase;

  final Localization localization;
  final AppSnackbar snackbar;

  AuthSessionEntity? session;

  Future<void> deleteUser() async {
    try {
      await deleteUserUseCase.call();
      session = null;
    } catch (e, s) {
      logError(e, s);

      snackbar.show(
        snackbar: (ctx) => Snackbars.error(
          ctx,
          text: localization.tr.generalError,
        ),
      );
    }
  }

  Future<void> forgotPassword({String? email, String? phone}) async {
    try {
      await forgotPasswordUseCase.call(email: email, phone: phone);
    } catch (e, s) {
      logError(e, s);

      snackbar.show(
        snackbar: (ctx) => Snackbars.error(
          ctx,
          text: localization.tr.generalError,
        ),
      );
    }
  }

  Future<void> signInWithCredentials({
    required AuthProviderEnum provider,
    String? idToken,
    String? accessToken,
  }) async {
    try {
      session = await signInWithCredentialsUseCase.call(
        provider: provider,
        idToken: idToken,
        accessToken: accessToken,
      );
    } catch (e, s) {
      logError(e, s);

      snackbar.show(
        snackbar: (ctx) => Snackbars.error(
          ctx,
          text: localization.tr.generalError,
        ),
      );
    }
  }

  Future<void> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      session = await signInWithEmailPasswordUseCase.call(
        email: email,
        password: password,
      );
    } catch (e, s) {
      logError(e, s);

      snackbar.show(
        snackbar: (ctx) => Snackbars.error(
          ctx,
          text: localization.tr.generalError,
        ),
      );
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      session = await signUpUseCase.call(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );
    } catch (e, s) {
      logError(e, s);

      snackbar.show(
        snackbar: (ctx) => Snackbars.error(
          ctx,
          text: localization.tr.generalError,
        ),
      );
    }
  }

  Future<void> signOut() async {
    try {
      await signOutUseCase.call();
      session = null;
    } catch (e, s) {
      logError(e, s);

      snackbar.show(
        snackbar: (ctx) => Snackbars.error(
          ctx,
          text: localization.tr.generalError,
        ),
      );
    }
  }

  Future<void> updatePassword({
    required String newPassword,
  }) async {
    try {
      await updatePasswordUseCase.call(
        newPassword,
      );
    } catch (e, s) {
      logError(e, s);

      snackbar.show(
        snackbar: (ctx) => Snackbars.error(
          ctx,
          text: localization.tr.generalError,
        ),
      );
    }
  }
}

import 'dart:async';

import 'package:app_session/src/domain/auth/enums/enums.dart';
import 'package:app_session/src/domain/auth/models/models.dart';
import 'package:app_session/src/domain/auth/requests/requests.dart';

/// Datasource for authentication.
abstract class AuthDatasource {
  /// Returns the current user.
  Future<User> getUser();

  /// Sign in with Google.
  Future<UserCredential> signInWithGoogle(
    SignInWithAppleRequestBody body,
  );

  /// Sign in with Apple.
  Future<UserCredential> signInWithApple(
    SignInWithAppleRequestBody body,
  );

  /// Sign in with email and password.
  Future<UserCredential> signInWithEmailAndPassword(
    SignInWithEmailAndPasswordRequestBody body,
  );

  /// Signs up with email and password.
  Future<void> signUpWithEmailAndPassword(
    SignUpWithEmailAndPasswordRequestBody body,
  );

  /// Reset password with email.
  Future<void> sendEmailToResetPassword(
    SendEmailToResetPasswordRequestBody body,
  );

  /// Sign out the current user.
  Future<void> signOut();

  /// Delete the current user.
  Future<void> deleteUser();

  /// Update the password of the current user.
  Future<void> updatePassword(
    UpdatePasswordRequestBody body,
  );

  /// Providers the current user.
  Future<List<AuthProvider>> getProviders();
}

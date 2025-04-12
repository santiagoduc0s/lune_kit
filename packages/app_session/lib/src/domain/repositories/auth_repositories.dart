import 'dart:async';

import 'package:app_session/src/domain/datasources/auth_datasource.dart';
import 'package:app_session/src/domain/enums/enums.dart';
import 'package:app_session/src/domain/models/models.dart';
import 'package:app_session/src/domain/requests/requests.dart';

/// Datasource for authentication.
class AuthRepository {
  /// Constructor for [AuthRepository].
  AuthRepository({
    required this.datasource,
  });

  /// Datasource for authentication.
  final AuthDatasource datasource;

  /// Get the current user.
  Future<User> getUser() {
    return datasource.getUser();
  }

  /// Sign in with Google.
  Future<UserCredential> signInWithGoogle(
    SignInWithAppleRequestBody body,
  ) {
    return datasource.signInWithGoogle(body);
  }

  /// Sign in with Apple.
  Future<UserCredential> signInWithApple(
    SignInWithAppleRequestBody body,
  ) {
    return datasource.signInWithApple(body);
  }

  /// Sign in with email and password.
  Future<UserCredential> signInWithEmailAndPassword(
    SignInWithEmailAndPasswordRequestBody body,
  ) {
    return datasource.signInWithEmailAndPassword(body);
  }

  /// Signs up with email and password.
  Future<void> signUpWithEmailAndPassword(
    SignUpWithEmailAndPasswordRequestBody body,
  ) {
    return datasource.signUpWithEmailAndPassword(body);
  }

  /// Reset password with email.
  Future<void> sendEmailToResetPassword(
    SendEmailToResetPasswordRequestBody body,
  ) {
    return datasource.sendEmailToResetPassword(body);
  }

  /// Sign out the current user.
  Future<void> signOut() {
    return datasource.signOut();
  }

  /// Delete the current user.
  Future<void> deleteUser() {
    return datasource.deleteUser();
  }

  /// Update the password of the current user.
  Future<void> updatePassword(
    UpdatePasswordRequestBody body,
  ) {
    return datasource.updatePassword(body);
  }

  /// Providers the current user.
  Future<List<AuthProvider>> getProviders() {
    return datasource.getProviders();
  }
}

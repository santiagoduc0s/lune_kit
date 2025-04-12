import 'dart:async';

import 'package:app_session/app_session.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;

/// Datasource for authentication using Firebase.
class AuthFirebaseDatasource extends AuthDatasource {
  final _firebaseAuth = fa.FirebaseAuth.instance;

  /// Returns the current user.
  @override
  Future<User> getUser() async {
    final user = _firebaseAuth.currentUser!;

    return User(
      id: user.uid,
    );
  }

  /// Sign in with Google.
  @override
  Future<UserCredential> signInWithGoogle(
    SignInWithAppleRequestBody body,
  ) async {
    final credentials = fa.OAuthProvider(
      AuthProvider.google.providerId,
    ).credential(
      accessToken: body.accessToken,
      idToken: body.idToken,
    );

    final credential = await _firebaseAuth.signInWithCredential(credentials);

    return UserCredential(
      accessToken: credential.credential!.accessToken!,
    );
  }

  /// Sign in with Apple.
  @override
  Future<UserCredential> signInWithApple(
    SignInWithAppleRequestBody body,
  ) async {
    final credentials = fa.OAuthProvider(
      AuthProvider.apple.providerId,
    ).credential(
      accessToken: body.accessToken,
      idToken: body.idToken,
    );

    final credential = await _firebaseAuth.signInWithCredential(credentials);

    return UserCredential(
      accessToken: credential.credential!.accessToken!,
    );
  }

  /// Sign in with email and password.
  @override
  Future<UserCredential> signInWithEmailAndPassword(
    SignInWithEmailAndPasswordRequestBody body,
  ) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: body.email,
      password: body.password,
    );

    return UserCredential(
      accessToken: credential.credential!.accessToken!,
    );
  }

  /// Signs up with email and password.
  @override
  Future<void> signUpWithEmailAndPassword(
    SignUpWithEmailAndPasswordRequestBody body,
  ) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: body.email,
      password: body.password,
    );
  }

  /// Reset password with email.
  @override
  Future<void> sendEmailToResetPassword(
    SendEmailToResetPasswordRequestBody body,
  ) async {
    await _firebaseAuth.sendPasswordResetEmail(
      email: body.email,
    );
  }

  /// Sign out the current user.
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  /// Delete the current user.
  @override
  Future<void> deleteUser() async {
    final user = _firebaseAuth.currentUser!;
    await user.delete();
  }

  /// Update the password of the current user.
  @override
  Future<void> updatePassword(
    UpdatePasswordRequestBody body,
  ) async {
    final user = _firebaseAuth.currentUser!;
    await user.updatePassword(body.password);
  }

  /// Provides the current user's providers.
  @override
  Future<List<AuthProvider>> getProviders() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return user.providerData.map((providerInfo) {
        switch (providerInfo.providerId) {
          case 'google.com':
            return AuthProvider.google;
          case 'apple.com':
            return AuthProvider.apple;
          case 'password':
            return AuthProvider.emailAndPassword;
          default:
            return AuthProvider.unknown;
        }
      }).toList();
    }
    return [];
  }
}

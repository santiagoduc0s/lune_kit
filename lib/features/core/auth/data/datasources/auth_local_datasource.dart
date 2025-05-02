import 'dart:async';

import 'package:core/core.dart';
import 'package:lune/features/core/auth/data/datasources/datasources.dart';
import 'package:lune/features/core/auth/data/models/models.dart';
import 'package:lune/features/core/auth/domain/enums/enums.dart';

class AuthLocalDatasource extends AuthDatasource {
  @override
  Future<void> deleteUser() {
    throw UnimplementedError();
  }

  @override
  Future<CredentialModel> getCurrentCredential() {
    throw UnimplementedError();
  }

  @override
  Future<void> forgotPassword({String? email, String? phone}) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getCurrentUser() {
    throw UnimplementedError();
  }

  @override
  Future<CredentialModel> signInWithCredentials({
    required AuthProviderEnum provider,
    String? idToken,
    String? accessToken,
    Map<String, dynamic>? extraData,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<CredentialModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<CredentialModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> storeUser({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? photo,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> updatePassword({required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> updateUser({
    required String id,
    String? firstName,
    String? lastName,
    NullableParameter<String?>? photo,
  }) {
    throw UnimplementedError();
  }
}

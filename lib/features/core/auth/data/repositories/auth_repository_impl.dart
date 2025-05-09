import 'dart:async';

import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/auth/data/data.dart';
import 'package:lune/features/core/auth/domain/entities/entities.dart';
import 'package:lune/features/core/auth/domain/repositories/repositories.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required this.datasource,
  });

  final AuthDatasource datasource;

  @override
  Future<UserEntity> getCurrentUser() {
    return datasource.getCurrentUser();
  }

  @override
  Future<AuthSessionEntity> getCurrentSession() async {
    final user = await datasource.getCurrentUser();
    final cred = await datasource.getCurrentCredential();

    return AuthSessionEntity(
      user: user,
      credential: cred,
    );
  }

  @override
  Future<UserEntity> storeUser({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? photo,
  }) {
    return datasource.storeUser(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      photo: photo,
    );
  }

  @override
  Future<UserEntity> updateUser({
    required String id,
    String? firstName,
    String? lastName,
    NullableParameter<String?>? photo,
  }) {
    return datasource.updateUser(
      id: id,
      firstName: firstName,
      lastName: lastName,
      photo: photo,
    );
  }

  @override
  Future<CredentialEntity> signInWithCredentials({
    required AuthProviderEntity provider,
    String? idToken,
    String? accessToken,
    Map<String, dynamic>? extraData,
  }) {
    return datasource.signInWithCredentials(
      provider: AuthProviderModel.fromEntity(provider),
      idToken: idToken,
      accessToken: accessToken,
      extraData: extraData,
    );
  }

  @override
  Future<CredentialEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return datasource.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<CredentialEntity> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return datasource.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() {
    return datasource.signOut();
  }

  @override
  Future<void> deleteUser() {
    return datasource.deleteUser();
  }

  @override
  Future<void> updatePassword({
    required String password,
  }) {
    return datasource.updatePassword(
      password: password,
    );
  }

  @override
  Future<void> forgotPassword({
    String? email,
    String? phone,
  }) {
    return datasource.forgotPassword(
      email: email,
      phone: phone,
    );
  }
}

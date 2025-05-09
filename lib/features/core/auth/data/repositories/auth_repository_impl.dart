import 'dart:async';

import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/auth/data/data.dart';
import 'package:lune/features/core/auth/domain/entities/entities.dart';
import 'package:lune/features/core/auth/domain/enums/enums.dart';
import 'package:lune/features/core/auth/domain/repositories/repositories.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required this.datasource,
  });

  final AuthDatasource datasource;

  @override
  Future<UserEntity> getCurrentUser() async {
    return (await datasource.getCurrentUser()).toEntity();
  }

  @override
  Future<AuthSessionEntity> getCurrentSession() async {
    final user = (await datasource.getCurrentUser()).toEntity();
    final cred = (await datasource.getCurrentCredential()).toEntity();

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
  }) async {
    return (await datasource.storeUser(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      photo: photo,
    ))
        .toEntity();
  }

  @override
  Future<UserEntity> updateUser({
    required String id,
    String? firstName,
    String? lastName,
    NullableParameter<String?>? photo,
  }) async {
    return (await datasource.updateUser(
      id: id,
      firstName: firstName,
      lastName: lastName,
      photo: photo,
    ))
        .toEntity();
  }

  @override
  Future<CredentialEntity> signInWithCredentials({
    required AuthProviderEnum provider,
    String? idToken,
    String? accessToken,
    Map<String, dynamic>? extraData,
  }) async {
    return (await datasource.signInWithCredentials(
      provider: provider,
      idToken: idToken,
      accessToken: accessToken,
      extraData: extraData,
    ))
        .toEntity();
  }

  @override
  Future<CredentialEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return (await datasource.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .toEntity();
  }

  @override
  Future<CredentialEntity> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return (await datasource.signUpWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .toEntity();
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

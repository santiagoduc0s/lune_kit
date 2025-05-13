import 'dart:async';

import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/auth/data/datasources/datasources.dart';
import 'package:lune/features/core/auth/data/models/models.dart';
import 'package:lune/features/core/auth/domain/enums/enums.dart';

class AuthDevDatasource extends AuthDatasource {
  static const _delay = Duration(milliseconds: 500);

  @override
  Future<void> deleteUser() {
    return Future.delayed(_delay);
  }

  @override
  Future<CredentialModel> getCurrentCredential() {
    // throw UnimplementedError();
    return Future.delayed(_delay, () {
      return const CredentialModel(
        accessToken: 'dev_access_token',
        extraData: {'dev': true},
        providers: [
          AuthProviderModel(
            value: AuthProviderEnum.emailAndPassword,
          ),
        ],
      );
    });
  }

  @override
  Future<void> forgotPassword({String? email, String? phone}) {
    return Future.delayed(_delay);
  }

  @override
  Future<UserModel> getCurrentUser() {
    return Future.delayed(_delay, () {
      final now = DateTime.now();
      return UserModel(
        id: 'dev_user_id',
        firstName: 'Dev',
        lastName: 'User',
        email: 'dev@lune.com',
        photo: 'https://placehold.co/100x100',
        updatedAt: now,
        createdAt: now,
      );
    });
  }

  @override
  Future<CredentialModel> signInWithCredentials({
    required AuthProviderModel provider,
    String? idToken,
    String? accessToken,
    Map<String, dynamic>? extraData,
  }) {
    return Future.delayed(_delay, () {
      return CredentialModel(
        accessToken: accessToken ?? 'dev_access_token',
        extraData: extraData ?? {'dev': true},
        providers: [provider],
      );
    });
  }

  @override
  Future<CredentialModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return Future.delayed(_delay, () {
      return const CredentialModel(
        accessToken: 'dev_access_token',
        extraData: {'dev': true},
        providers: [
          AuthProviderModel(
            value: AuthProviderEnum.emailAndPassword,
          ),
        ],
      );
    });
  }

  @override
  Future<void> signOut() {
    return Future.delayed(_delay);
  }

  @override
  Future<CredentialModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return Future.delayed(_delay, () {
      return const CredentialModel(
        accessToken: 'dev_access_token',
        extraData: {'dev': true},
        providers: [
          AuthProviderModel(
            value: AuthProviderEnum.emailAndPassword,
          ),
        ],
      );
    });
  }

  @override
  Future<UserModel> storeUser({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? photo,
  }) {
    return Future.delayed(_delay, () {
      final now = DateTime.now();
      return UserModel(
        id: 'dev_user_id',
        firstName: firstName,
        lastName: lastName,
        email: email,
        photo: photo,
        updatedAt: now,
        createdAt: now,
      );
    });
  }

  @override
  Future<void> updatePassword({required String password}) {
    return Future.delayed(_delay);
  }

  @override
  Future<UserModel> updateUser({
    required String id,
    String? firstName,
    String? lastName,
    NullableParameter<String?>? photo,
  }) {
    return Future.delayed(_delay, () {
      final now = DateTime.now();
      return UserModel(
        id: id,
        firstName: firstName ?? 'Dev',
        lastName: lastName ?? 'User',
        email: 'dev@lune.com',
        photo: photo?.value ?? 'https://placehold.co/100x100',
        updatedAt: now,
        createdAt: now,
      );
    });
  }
}

import 'dart:async';

import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/auth/domain/entities/entities.dart';
import 'package:lune/features/core/auth/domain/enums/enums.dart';

abstract class AuthRepository {
  Future<UserEntity> getCurrentUser();

  Future<AuthSessionEntity> getCurrentSession();

  Future<UserEntity> storeUser({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? photo,
  });

  Future<UserEntity> updateUser({
    required String id,
    String? firstName,
    String? lastName,
    NullableParameter<String?>? photo,
  });

  Future<CredentialEntity> signInWithCredentials({
    required AuthProviderEnum provider,
    String? idToken,
    String? accessToken,
    Map<String, dynamic>? extraData,
  });

  Future<CredentialEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<CredentialEntity> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<void> deleteUser();

  Future<void> updatePassword({
    required String password,
  });

  Future<void> forgotPassword({
    String? email,
    String? phone,
  });
}

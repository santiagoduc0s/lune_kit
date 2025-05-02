import 'dart:async';

import 'package:core/core.dart';
import 'package:lune/features/core/auth/data/models/models.dart';
import 'package:lune/features/core/auth/domain/enums/enums.dart';

abstract class AuthDatasource {
  Future<UserModel> getCurrentUser();

  Future<CredentialModel> getCurrentCredential();

  Future<UserModel> storeUser({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? photo,
  });

  Future<UserModel> updateUser({
    required String id,
    String? firstName,
    String? lastName,
    NullableParameter<String?>? photo,
  });

  Future<CredentialModel> signInWithCredentials({
    required AuthProviderEnum provider,
    String? idToken,
    String? accessToken,
    Map<String, dynamic>? extraData,
  });

  Future<CredentialModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<CredentialModel> signUpWithEmailAndPassword({
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

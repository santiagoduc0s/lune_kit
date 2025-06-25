import 'dart:async';
import 'dart:typed_data';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/domain/entities/entities.dart';

abstract class AuthRepository {
  Future<bool> isAuthenticated();

  Future<UserEntity?> currentUser();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
    Uint8List? photo,
  });

  Future<void> forgotPassword({
    String? email,
    String? phone,
  });

  Future<void> updatePassword({
    required String password,
  });

  Future<void> signOut();

  Future<void> deleteUser();

  Future<UserEntity> updateCurrentUser({
    String? firstName,
    String? lastName,
    NullableParameter<Uint8List?>? photo,
    bool? notificationsAreEnabled,
  });

  Future<void> reauthenticateWithCredential(
    AuthProviderType provider,
    Map<String, dynamic> data,
  );
}

import 'package:equatable/equatable.dart';
import 'package:lune/features/core/auth/auth.dart';

class AuthSessionEntity extends Equatable {
  const AuthSessionEntity({
    required this.user,
    required this.credential,
  });

  final UserEntity user;
  final CredentialEntity credential;

  AuthSessionEntity copyWith({
    UserEntity? user,
    CredentialEntity? credential,
  }) {
    return AuthSessionEntity(
      user: user ?? this.user,
      credential: credential ?? this.credential,
    );
  }

  @override
  List<Object?> get props {
    return [
      user,
      credential,
    ];
  }
}

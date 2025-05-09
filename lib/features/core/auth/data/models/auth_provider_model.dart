import 'package:lune/features/core/auth/domain/entities/entities.dart';
import 'package:lune/features/core/auth/domain/enums/enums.dart';

class AuthProviderModel extends AuthProviderEntity {
  const AuthProviderModel({
    required super.value,
  });

  factory AuthProviderModel.formString(String provider) {
    switch (provider) {
      case 'google.com':
        return const AuthProviderModel(
          value: AuthProviderEnum.google,
        );
      case 'apple.com':
        return const AuthProviderModel(
          value: AuthProviderEnum.apple,
        );
      case 'password':
        return const AuthProviderModel(
          value: AuthProviderEnum.emailAndPassword,
        );
      default:
        return const AuthProviderModel(
          value: AuthProviderEnum.unknown,
        );
    }
  }

  factory AuthProviderModel.fromEntity(AuthProviderEntity entity) {
    return AuthProviderModel(
      value: entity.value,
    );
  }
}

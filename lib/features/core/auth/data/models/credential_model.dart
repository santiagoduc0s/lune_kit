import 'package:lune/features/core/auth/domain/entities/entities.dart';
import 'package:lune/features/core/auth/domain/enums/enums.dart';

class CredentialModel {
  CredentialModel({
    required this.accessToken,
    required this.extraData,
    required this.providers,
  });

  factory CredentialModel.fromJson(Map<String, dynamic> json) {
    return CredentialModel(
      accessToken: json['accessToken'] as String,
      extraData: json['extraData'] as Map<String, dynamic>,
      providers: (json['providers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );
  }

  final String accessToken;
  final Map<String, dynamic> extraData;
  final List<String> providers;

  CredentialEntity toEntity() {
    return CredentialEntity(
      accessToken: accessToken,
      extraData: extraData,
      providers: providers.map(
        (String val) {
          switch (val) {
            case 'google.com':
              return AuthProviderEnum.google;
            case 'apple.com':
              return AuthProviderEnum.apple;
            case 'password':
              return AuthProviderEnum.emailAndPassword;
            case 'facebook.com':
              return AuthProviderEnum.facebook;
            default:
              return AuthProviderEnum.unknown;
          }
        },
      ).toList(),
    );
  }
}

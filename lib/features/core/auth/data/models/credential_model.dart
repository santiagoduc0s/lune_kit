import 'package:lune/features/core/auth/data/models/models.dart';
import 'package:lune/features/core/auth/domain/entities/entities.dart';

class CredentialModel extends CredentialEntity {
  const CredentialModel({
    required super.accessToken,
    required super.extraData,
    required super.providers,
  });

  factory CredentialModel.fromJson(Map<String, dynamic> json) {
    return CredentialModel(
      accessToken: json['accessToken'] as String,
      extraData: json['extraData'] as Map<String, dynamic>,
      providers: (json['providers'] as List<dynamic>)
          .map((e) => e as String)
          .map(AuthProviderModel.formString)
          .toList(),
    );
  }
}

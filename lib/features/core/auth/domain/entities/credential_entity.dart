import 'package:equatable/equatable.dart';
import 'package:lune/features/core/auth/auth.dart';

class CredentialEntity extends Equatable {
  const CredentialEntity({
    required this.accessToken,
    this.providers = const [],
    this.extraData = const {},
  });

  final String accessToken;
  final List<AuthProviderEnum> providers;
  final Map<String, dynamic> extraData;

  @override
  List<Object?> get props {
    return [
      accessToken,
      extraData,
    ];
  }
}

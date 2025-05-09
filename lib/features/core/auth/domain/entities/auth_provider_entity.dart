import 'package:equatable/equatable.dart';
import 'package:lune/features/core/auth/domain/enums/enums.dart';

class AuthProviderEntity extends Equatable {
  const AuthProviderEntity({
    required this.value,
  });

  final AuthProviderEnum value;

  @override
  List<Object?> get props {
    return [
      value,
    ];
  }
}

import 'package:core/core.dart';
import 'package:lune/features/core/auth/domain/entities/entities.dart';
import 'package:lune/features/core/auth/domain/repositories/repositories.dart';

class UpdateProfileUseCase {
  UpdateProfileUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<UserEntity> call({
    required String id,
    String? firstName,
    String? lastName,
    NullableParameter<String?>? photo,
  }) {
    return _authRepository.updateUser(
      id: id,
      firstName: firstName,
      lastName: lastName,
      photo: photo,
    );
  }
}

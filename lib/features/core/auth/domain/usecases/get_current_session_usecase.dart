import 'package:lune/features/core/auth/domain/entities/entities.dart';
import 'package:lune/features/core/auth/domain/repositories/repositories.dart';

class GetCurrentSessionUseCase {
  GetCurrentSessionUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<AuthSessionEntity> call() {
    return _authRepository.getCurrentSession();
  }
}

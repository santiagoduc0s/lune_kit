import 'package:lune/features/core/auth/domain/repositories/repositories.dart';

class DeleteUserUseCase {
  DeleteUserUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<void> call() {
    return _authRepository.deleteUser();
  }
}

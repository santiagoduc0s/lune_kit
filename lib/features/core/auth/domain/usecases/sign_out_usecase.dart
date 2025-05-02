import 'package:lune/features/core/auth/domain/repositories/repositories.dart';

class SignOutUseCase {
  SignOutUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<void> call() {
    return _authRepository.signOut();
  }
}

import 'package:lune/features/core/auth/domain/repositories/repositories.dart';

class UpdatePasswordUseCase {
  UpdatePasswordUseCase(this.repository);

  final AuthRepository repository;

  Future<void> call(String password) {
    return repository.updatePassword(password: password);
  }
}

import 'package:lune/domain/repositories/repositories.dart';

class UpdatePasswordUseCase {
  UpdatePasswordUseCase(this._repository);

  final AuthRepository _repository;

  Future<void> call(String password) {
    return _repository.updatePassword(password: password);
  }
}

import 'package:lune/domain/entities/entities.dart';
import 'package:lune/domain/repositories/repositories.dart';

class SignInWithEmailPasswordUseCase {
  SignInWithEmailPasswordUseCase(
    this._authRepository,
  );

  final AuthRepository _authRepository;

  Future<UserEntity> call({
    required String email,
    required String password,
  }) async {
    await _authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return (await _authRepository.currentUser())!;
  }
}

import 'package:lune/features/core/auth/domain/domain.dart';

class SignInWithEmailPasswordUseCase {
  SignInWithEmailPasswordUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<AuthSessionEntity> call({
    required String email,
    required String password,
  }) async {
    final cred = await _authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = await _authRepository.getCurrentUser();

    return AuthSessionEntity(
      user: user,
      credential: cred,
    );
  }
}

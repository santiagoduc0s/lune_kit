import 'package:lune/features/core/auth/domain/domain.dart';

class SignUpUseCase {
  SignUpUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<AuthSessionEntity> call({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    String? photo,
  }) async {
    final cred = await _authRepository.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = await _authRepository.storeUser(
      id: cred.extraData['id'] as String?,
      email: email,
      firstName: firstName,
      lastName: lastName,
      photo: photo,
    );

    return AuthSessionEntity(
      user: user,
      credential: cred,
    );
  }
}

import 'package:lune/features/core/auth/domain/domain.dart';

class SignInWithCredentialsUseCase {
  SignInWithCredentialsUseCase(this.authRepository);

  final AuthRepository authRepository;

  Future<AuthSessionEntity> call({
    required AuthProviderEnum provider,
    String? idToken,
    String? accessToken,
  }) async {
    final userCred = await authRepository.signInWithCredentials(
      provider: provider,
      idToken: idToken,
      accessToken: accessToken,
    );

    late UserEntity user;
    try {
      user = await authRepository.getCurrentUser();
    } catch (e) {
      user = await authRepository.storeUser(
        id: userCred.extraData['id'] as String?,
        email: userCred.extraData['email'] as String?,
        firstName: userCred.extraData['firstName'] as String?,
        lastName: userCred.extraData['lastName'] as String?,
      );
    }

    return AuthSessionEntity(
      credential: userCred,
      user: user,
    );
  }
}

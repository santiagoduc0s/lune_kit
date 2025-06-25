import 'dart:typed_data';
import 'package:lune/domain/repositories/repositories.dart';

class SignUpUseCase {
  SignUpUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<void> call({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    Uint8List? photo,
  }) async {
    await _authRepository.signUpWithEmailAndPassword(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      photo: photo,
    );
  }
}

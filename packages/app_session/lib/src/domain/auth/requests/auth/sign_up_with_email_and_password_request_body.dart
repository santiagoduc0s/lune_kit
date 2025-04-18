import 'package:http_client/http_client.dart';

/// Represents the request body for signing up with email and password.
/// 
/// This could be edited to include additional fields.
class SignUpWithEmailAndPasswordRequestBody extends RequestBody {
  /// Creates an instance of [SignUpWithEmailAndPasswordRequestBody].
  SignUpWithEmailAndPasswordRequestBody({
    required this.email,
    required this.password,
  });

  /// The email address of the user.
  final String email;

  /// The password of the user.
  final String password;

  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    }..removeWhere((key, value) => value == null);
  }
}

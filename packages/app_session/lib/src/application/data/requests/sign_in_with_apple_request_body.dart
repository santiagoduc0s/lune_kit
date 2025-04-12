import 'package:http_client/http_client.dart';

/// Represents the request body for signing in with Apple.
class SignInWithAppleRequestBody extends RequestBody {
  /// Creates an instance of [SignInWithAppleRequestBody].
  SignInWithAppleRequestBody({
    this.idToken,
    this.accessToken,
  });

  /// The ID token obtained from Apple Sign-In.
  final String? idToken;

  /// The access token obtained from Apple Sign-In.
  final String? accessToken;

  @override
  Map<String, dynamic> toJson() {
    return {
      'idToken': idToken,
      'accessToken': accessToken,
    }..removeWhere((key, value) => value == null);
  }
}

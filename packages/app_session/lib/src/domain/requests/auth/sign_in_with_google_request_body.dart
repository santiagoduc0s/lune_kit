import 'package:http_client/http_client.dart';

/// Represents the request body for signing in with Google.
class SignInWithGoogleRequestBody extends RequestBody {
  /// Creates an instance of [SignInWithGoogleRequestBody].
  SignInWithGoogleRequestBody({
    this.idToken,
    this.accessToken,
  });

  /// The ID token obtained from Google Sign-In.
  final String? idToken;

  /// The access token obtained from Google Sign-In.
  final String? accessToken;

  @override
  Map<String, dynamic> toJson() {
    return {
      'idToken': idToken,
      'accessToken': accessToken,
    }..removeWhere((key, value) => value == null);
  }
}

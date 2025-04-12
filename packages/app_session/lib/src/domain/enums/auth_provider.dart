/// Enum representing different authentication providers.
enum AuthProvider {
  /// Authentication using email and password.
  emailAndPassword,

  /// Authentication using Google.
  google,

  /// Authentication using Apple.
  apple,

  /// Authentication using Facebook.
  facebook;

  /// Converts a string to the corresponding [AuthProvider].
  static AuthProvider fromString(String value) {
    switch (value) {
      case 'google.com':
        return AuthProvider.google;
      case 'apple.com':
        return AuthProvider.apple;
      case 'password':
        return AuthProvider.emailAndPassword;
      case 'facebook.com':
        return AuthProvider.facebook;
      default:
        throw Exception('Unknown UserAuthProvider');
    }
  }

  /// Converts the [AuthProvider] to a string.
  String get providerId {
    switch (this) {
      case AuthProvider.google:
        return 'google.com';
      case AuthProvider.apple:
        return 'apple.com';
      case AuthProvider.emailAndPassword:
        return 'password';
      case AuthProvider.facebook:
        return 'facebook.com';
    }
  }
}

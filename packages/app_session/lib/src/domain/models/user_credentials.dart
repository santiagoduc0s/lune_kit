/// User credentials model
class UserCredential {
  /// Constructor
  UserCredential({
    required this.accessToken,
    required this.typeAccessToken,
  });

  /// Access token
  final String accessToken;

  /// Type of access token
  final String? typeAccessToken;
}

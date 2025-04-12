/// User credentials model
class UserCredential {
  /// Constructor
  UserCredential({
    required this.accessToken,
    this.typeAccessToken,
  });

  /// Access token
  final String accessToken;

  /// Type of access token
  final String? typeAccessToken;
}

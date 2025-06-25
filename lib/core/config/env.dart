/// A simple class to get the environment variable
class Env {
  /// The environment variable
  static const String environment = String.fromEnvironment('ENV');

  static const String revenueCatApiKey =
      String.fromEnvironment('REVENUECAT_API_KEY');
}

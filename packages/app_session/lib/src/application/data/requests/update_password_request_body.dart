import 'package:http_client/http_client.dart';

/// Represents the request body for updating the password.
class UpdatePasswordRequestBody extends RequestBody {
  /// Creates an instance of [UpdatePasswordRequestBody].
  UpdatePasswordRequestBody({
    required this.password,
  });

  /// The new password to be set.
  final String password;

  @override
  Map<String, dynamic> toJson() {
    return {
      'password': password,
    };
  }
}

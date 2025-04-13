import 'package:http_client/http_client.dart';

/// Represents the request body for sending an email to reset password.
class SendEmailToResetPasswordRequestBody extends RequestBody {
  /// Creates an instance of [SendEmailToResetPasswordRequestBody].
  SendEmailToResetPasswordRequestBody({
    required this.email,
  });

  /// The email address to send the reset password link to.
  final String email;

  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}

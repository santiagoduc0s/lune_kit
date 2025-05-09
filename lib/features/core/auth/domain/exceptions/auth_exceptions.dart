/// Email verification exception.
class EmailDoesNotVerifiedException implements Exception {}

/// Wrong password exception.
class WrongPasswordException implements Exception {}

/// Invalid email format exception.
class InvalidEmailFormatException implements Exception {}

/// Invalid credential exception.
class InvalidCredentialException implements Exception {}

/// Email already in use exception.
class EmailAlreadyInUseException implements Exception {}

/// Weak password exception.
class WeakPasswordException implements Exception {}

/// User disabled exception.
class UserDisabledException implements Exception {}

/// Account exists with different credential exception.
class AccountExistsWithDifferentCredentialException implements Exception {}

/// User cancelled the operation.
class CancelledByUserException implements Exception {}

/// User not found exception.
class UserNotFoundException implements Exception {}

/// Permission denied exception.
class PermissionDeniedUsersException implements Exception {}

/// Provide just one of email or phone exception.
class ProvideJustOneOfEmailOrPhoneException implements Exception {}

/// Provide at least one of email or phone exception.
class ProvideAtLeastOneOfEmailOrPhoneException implements Exception {}

/// Invalid verification code exception.
class InvalidVerificationCodeException implements Exception {}

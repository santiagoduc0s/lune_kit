import 'package:app_session/src/domain/auth/models/models.dart';
import 'package:core/core.dart';

/// This class is used to manage the app's session
class UserSession {
  UserSession._singleton();

  /// Singleton instance of [UserSession].
  static final UserSession instance = UserSession._singleton();

  /// Channel to notify changes in app preferences.
  final notifier = DataNotifier<User?>();

  /// Stream to listen for changes in app preferences.
  Stream<User?> get stream => notifier.stream;

  /// User instance.
  User? _user;

  /// User instance.
  User? get user => _user;

  /// Sign out the user.
  void signIn(User user) {
    _user = user;
    notifier.emit(user);
  }

  /// Sign out the user.
  void signOut() {
    _user = null;
    notifier.emit(_user);
  }

  /// User check.
  bool get check {
    return _user != null;
  }
}

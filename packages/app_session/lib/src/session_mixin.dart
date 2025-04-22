import 'package:app_session/src/user.dart';
import 'package:core/core.dart';

/// A mixin that provides a session management system
mixin SessionMixin<T extends User> {
  /// The session value
  T? _user;

  /// The session value getter
  T? get user => _user;

  set user(T? value) {
    _user = value;
  }

  /// The session value setter
  void signIn(T data);

  /// The session value setter
  void signOut();

  /// The session value setter
  bool get isSignedIn;

  /// The session value setter
  bool get isSignedOut;
}

/// EXAMPLE CLASS
class UserExample extends User {
  /// Constructor [UserExample]
  const UserExample({
    required super.id,
    required this.name,
  });

  /// The user name
  final String name;
}

/// EXAMPLE CLASS: This class is used to manage the app's session
/// A singleton session manager for any kind of User, create your
/// own class adding the [SessionMixin]
class UserSessionExample with SessionMixin<UserExample> {
  UserSessionExample._singleton();

  /// Singleton instance of [UserSessionExample]
  static final instance = UserSessionExample._singleton();

  /// Singleton instance of the session
  final notifier = DataNotifier<UserExample?>();

  /// The session stream to listen the changes of the user
  Stream<UserExample?> get stream => notifier.stream;

  @override
  void signIn(UserExample user) {
    this.user = user;
    notifier.emit(user);
  }

  @override
  void signOut() {
    user = null;
    notifier.emit(null);
  }

  @override
  bool get isSignedIn => user != null;

  @override
  bool get isSignedOut => user == null;
}

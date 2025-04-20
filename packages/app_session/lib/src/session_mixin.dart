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
  void signIn(SignInData<T> data);

  /// The session value setter
  void signOut();

  /// The session value setter
  bool get isSignedIn;

  /// The session value setter
  bool get isSignedOut;
}

/// This class is used to manage the sign in data
///
/// If you want to save more data for example a "token" you can
/// add that information in this class and the do what you need
/// in the signIn method
class SignInData<T> {
  /// Constructor [SignInData]
  SignInData({
    required this.user,
  });

  /// The user
  final T user;
}

/// EXAMPLE CLASS: This class is used to manage the app's session
/// A singleton session manager for any kind of User, create your
/// own class adding the [SessionMixin]
class UserSessionExample with SessionMixin<User> {
  UserSessionExample._singleton();

  /// Singleton instance of [UserSessionExample]
  static final instance = UserSessionExample._singleton();

  /// Singleton instance of the session
  final notifier = DataNotifier<User?>();

  /// The session stream to listen the changes of the user
  Stream<User?> get stream => notifier.stream;

  @override
  void signIn(SignInData<User> data) {
    user = data.user;
    notifier.emit(data.user);
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

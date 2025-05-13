import 'package:flutter/foundation.dart';
import 'package:lune/config/router/router.dart';
import 'package:lune/features/core/auth/domain/entities/entities.dart';
import 'package:lune/features/core/auth/domain/usecases/usecases.dart';

class AuthNotifier extends ChangeNotifier {
  AuthNotifier({
    required this.router,
    required this.getCurrentSessionUseCase,
  });

  final AppRouter router;
  final GetCurrentSessionUseCase getCurrentSessionUseCase;

  AuthSessionEntity? session;

  bool get isLoggedIn => session != null;

  Future<void> initialize() async {
    try {
      session = await getCurrentSessionUseCase.call();
    } catch (e) {
      session = null;
    }
  }

  void setSession(AuthSessionEntity? session) {
    this.session = session;
    notifyListeners();
    router.refresh();
  }

  void signOut() {
    setSession(null);
  }

  void setUser(UserEntity user) {
    session = session?.copyWith(user: user);
    notifyListeners();
  }
}

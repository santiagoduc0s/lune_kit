import 'package:flutter/foundation.dart';
import 'package:lune/config/router/router.dart';
import 'package:lune/features/core/auth/domain/entities/entities.dart';

class AuthNotifier extends ChangeNotifier {
  AuthNotifier({
    required this.router,
  });

  final AppRouter router;

  AuthSessionEntity? session;

  void setSession(AuthSessionEntity? session) {
    this.session = session;
    notifyListeners();
    router.refresh();
  }

  void setUser(UserEntity user) {
    session = session?.copyWith(user: user);
    notifyListeners();
  }
}

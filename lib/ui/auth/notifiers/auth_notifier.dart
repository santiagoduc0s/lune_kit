import 'package:flutter/foundation.dart';
import 'package:lune/domain/entities/entities.dart';
import 'package:lune/domain/repositories/repositories.dart';

class AuthNotifier extends ChangeNotifier {
  AuthNotifier(this._authRepository);

  final AuthRepository _authRepository;

  UserEntity? _currentUser;
  UserEntity? get currentUser => _currentUser;

  bool get isAuthenticated => _currentUser != null;
  bool get isNotAuthenticated => _currentUser == null;

  Future<void> initialize() async {
    if (!await _authRepository.isAuthenticated()) return;

    _currentUser = await _authRepository.currentUser();
    if (_currentUser == null) {
      await _authRepository.signOut();
      return;
    }
  }

  void setUser(UserEntity user) {
    _currentUser = user;
    notifyListeners();
  }

  Future<void> signOut() async {
    _currentUser = null;
    notifyListeners();
  }
}

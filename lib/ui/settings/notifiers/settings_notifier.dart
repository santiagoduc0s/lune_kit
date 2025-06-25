import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lune/core/extensions/extensions.dart';
import 'package:lune/core/ui/alerts/dialog/dialog.dart';
import 'package:lune/core/ui/alerts/snackbar/snackbar.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/domain/entities/entities.dart';
import 'package:lune/domain/repositories/repositories.dart';
import 'package:lune/domain/usecases/device/device.dart';
import 'package:lune/domain/usecases/messaging/messaging.dart';
import 'package:lune/domain/usecases/permission/permission.dart';
import 'package:lune/router/router.dart';
import 'package:lune/ui/auth/notifiers/notifiers.dart';
import 'package:lune/ui/sign_in/widgets/widgets.dart';

class SettingsNotifier extends ChangeNotifier {
  SettingsNotifier({
    required AuthRepository authRepository,
    required void Function() onSignOut,
    required RequestPermissionUseCase requestPermissionUseCase,
    required OpenSettingsUseCase openSettingsUseCase,
    required CheckPermissionUseCase checkPermissionUseCase,
    required SaveTokenUseCase saveTokenUseCase,
    required GetDeviceUseCase getDeviceUseCase,
    required CustomDialog dialog,
    required CustomSnackbar snackbar,
    required Localization localization,
    required CustomRouter router,
    required AuthNotifier authNotifier,
  })  : _router = router,
        _localization = localization,
        _snackbar = snackbar,
        _dialog = dialog,
        _getDeviceUseCase = getDeviceUseCase,
        _saveTokenUseCase = saveTokenUseCase,
        _checkPermissionUseCase = checkPermissionUseCase,
        _openSettingsUseCase = openSettingsUseCase,
        _requestPermissionUseCase = requestPermissionUseCase,
        _authRepository = authRepository,
        _onSignOut = onSignOut,
        _authNotifier = authNotifier;

  final AuthRepository _authRepository;
  final RequestPermissionUseCase _requestPermissionUseCase;
  final OpenSettingsUseCase _openSettingsUseCase;
  final CheckPermissionUseCase _checkPermissionUseCase;
  final SaveTokenUseCase _saveTokenUseCase;
  final GetDeviceUseCase _getDeviceUseCase;
  final CustomDialog _dialog;
  final CustomSnackbar _snackbar;
  final Localization _localization;
  final CustomRouter _router;
  final AuthNotifier _authNotifier;

  final void Function() _onSignOut;

  bool notificationsEnabled = false;
  bool isDeletingAccount = false;

  @override
  void dispose() {
    _authNotifier.removeListener(_authListener);
    super.dispose();
  }

  Future<void> initialize() async {
    _authNotifier.addListener(_authListener);

    if (_authNotifier.isNotAuthenticated) return;

    final device = await _getDeviceUseCase.call();

    notificationsEnabled = device.notificationsAreEnabled;
    notifyListeners();

    unawaited(_saveTokenUseCase.call().catchError((_) {}));
  }

  Future<void> _authListener() async {
    if (_authNotifier.isAuthenticated) {
      final device = await _getDeviceUseCase.call();
      notificationsEnabled = device.notificationsAreEnabled;
      notifyListeners();
    } else {
      notificationsEnabled = false;
      notifyListeners();
    }
  }

  Future<void> setNotificationsEnabled(bool value) async {
    if (!await _authRepository.isAuthenticated()) {
      final wantToSignIn = await dialogConfirm(
        _dialog,
        message: _localization.tr.confirmSignInNotification,
        confirmText: _localization.tr.iWantIt,
        cancelText: _localization.tr.cancel,
      );

      if (wantToSignIn) {
        await _router.pushNamed<void>(SignInScreen.path);
      }

      return;
    }

    final previousState = notificationsEnabled;

    try {
      if (value) {
        var status = await _checkPermissionUseCase.call(
          PermissionType.notifications,
        );

        if (status == PermissionStatus.permanentlyDenied) {
          final shouldOpenSettings = await dialogConfirm(
            _dialog,
            message: _localization.tr.notificationsAreDisabled,
            confirmText: _localization.tr.goToSettings,
            cancelText: _localization.tr.cancel,
          );
          if (shouldOpenSettings) {
            await _openSettingsUseCase.call();
          }
          notificationsEnabled = false;
        } else {
          notificationsEnabled = false;
        }

        if (status == PermissionStatus.denied) {
          final requestStatus = await _requestPermissionUseCase.call(
            PermissionType.notifications,
          );

          status = requestStatus;
        }

        if (status == PermissionStatus.granted) {
          notificationsEnabled = true;
          notifyListeners();

          await _saveTokenUseCase.call();
          await _authRepository.updateCurrentUser(
            notificationsAreEnabled: true,
          );
        }
      } else {
        notificationsEnabled = false;
        notifyListeners();

        if (previousState) {
          await _authRepository.updateCurrentUser(
            notificationsAreEnabled: false,
          );
        }
      }
    } catch (e, s) {
      notificationsEnabled = previousState;
      notifyListeners();
      logError(e, s);
      errorSnackbar(_snackbar, _localization.tr.generalError);
    }
  }

  Future<void> deleteAccount() async {
    if (isDeletingAccount) return;

    isDeletingAccount = true;
    notifyListeners();

    try {
      final shouldDelete = await dialogConfirm(
        _dialog,
        message: _localization.tr.deleteAccountMessage,
        confirmText: _localization.tr.yes,
        cancelText: _localization.tr.cancel,
      );

      if (!shouldDelete) return;

      final password = await _dialog.showWithoutContext<String>(
        builder: (context) {
          return PasswordDialog(
            message: _localization.tr.enterPassword,
            confirmText: _localization.tr.delete,
            cancelText: _localization.tr.cancel,
          );
        },
      );

      if (password != null && password.isNotEmpty) {
        await _authRepository.reauthenticateWithCredential(
          AuthProviderType.email,
          {'password': password},
        );
        await _authRepository.deleteUser();
        await _authRepository.signOut();
        _onSignOut();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        errorSnackbar(_snackbar, _localization.tr.invalidPassword);
        return;
      }
      rethrow;
    } catch (e, s) {
      logError(e, s);
      errorSnackbar(_snackbar, _localization.tr.generalError);
    } finally {
      isDeletingAccount = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    _onSignOut();
  }
}

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lune/core/extensions/extensions.dart';
import 'package:lune/core/functions/functions.dart';
import 'package:lune/core/ui/alerts/snackbar/snackbar.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/domain/repositories/repositories.dart';
import 'package:lune/ui/auth/notifiers/notifiers.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProfileNotifier extends ChangeNotifier {
  ProfileNotifier({
    required AuthRepository authRepository,
    required CustomSnackbar snackbar,
    required Localization localization,
    required AuthNotifier authNotifier,
  })  : _localization = localization,
        _snackbar = snackbar,
        _authRepository = authRepository,
        _authNotifier = authNotifier;

  final AuthRepository _authRepository;
  final CustomSnackbar _snackbar;
  final Localization _localization;
  final AuthNotifier _authNotifier;

  bool _isUpdatingData = false;
  XFile? _originalPhoto;

  bool get isUpdatingData => _isUpdatingData;
  bool get hasPhotoChanged {
    final currentPhoto = _form.control('photo').value as XFile?;
    return _originalPhoto?.path != currentPhoto?.path;
  }

  final FormGroup _form = FormGroup({
    'photo': FormControl<XFile?>(),
    'firstName': FormControl<String>(
      value: '',
      validators: [
        Validators.required,
      ],
    ),
    'lastName': FormControl<String>(
      value: '',
      validators: [Validators.required],
    ),
    'email': FormControl<String>(
      value: '',
      disabled: true,
    ),
  });
  FormGroup get form => _form;

  @override
  void dispose() {
    _authNotifier.removeListener(_authListener);
    _form.dispose();
    super.dispose();
  }

  Future<void> initialize() async {
    _authNotifier.addListener(_authListener);

    await _fillForm();
  }

  Future<void> _authListener() async {
    await _fillForm();
  }

  Future<void> _fillForm() async {
    if (_authNotifier.isNotAuthenticated) {
      resetForm();
      return;
    }

    final user = _authNotifier.currentUser!;
    _form.control('firstName').value = user.firstName;
    _form.control('lastName').value = user.lastName;
    _form.control('email').value = user.email;
    if (user.photo != null) {
      final photo = await xFileFromUrl(user.photo!);
      _form.control('photo').value = photo;
      _originalPhoto = photo;
    } else {
      _form.control('photo').value = null;
    }
  }

  void __isUpdatingData(bool value) {
    _isUpdatingData = value;
    notifyListeners();
  }

  Future<void> updateProfile() async {
    if (!_form.valid) {
      _form.markAllAsTouched();
      return;
    }

    if (_isUpdatingData) return;

    __isUpdatingData(true);

    try {
      final photo = _form.control('photo').value as XFile?;

      await _authRepository.updateCurrentUser(
        firstName: _form.control('firstName').value as String,
        lastName: _form.control('lastName').value as String,
        photo: hasPhotoChanged
            ? (photo != null
                ? NullableParameter(await photo.readAsBytes())
                : const NullableParameter(null))
            : null,
      );

      primarySnackbar(_snackbar, _localization.tr.profile_userUpdated);
    } catch (e, s) {
      errorSnackbar(_snackbar, _localization.tr.generalError);
      logError(e, s);
    } finally {
      __isUpdatingData(false);
    }
  }

  void resetForm() {
    _form.control('firstName').value = '';
    _form.control('lastName').value = '';
    _form.control('email').value = '';
    _form.control('photo').value = null;
  }
}

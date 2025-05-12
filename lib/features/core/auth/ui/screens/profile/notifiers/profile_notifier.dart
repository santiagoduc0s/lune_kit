import 'package:flutter/material.dart';
import 'package:lune/core/extensions/extensions.dart';
import 'package:lune/core/ui/alerts/snackbar/snackbar.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/features/core/auth/domain/entities/entities.dart';
import 'package:lune/features/core/auth/domain/usecases/usecases.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProfileNotifier extends ChangeNotifier {
  ProfileNotifier({
    required this.updateProfileUseCase,
    required this.snackbar,
    required this.localization,
    required this.user,
    this.isUpdatingData = false,
    this.isUpdatingPhoto = false,
  });

  final UpdateProfileUseCase updateProfileUseCase;
  final AppSnackbar snackbar;
  final Localization localization;

  UserEntity user;
  bool isUpdatingData;
  bool isUpdatingPhoto;

  final FormGroup form = FormGroup({
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

  void init() {
    _updateForm();
  }

  void _updateForm() {
    form.control('firstName').value = user.firstName;
    form.control('lastName').value = user.lastName;
    form.control('email').value = user.email;
  }

  void _isUpdatingData(bool value) {
    isUpdatingData = value;
    notifyListeners();
  }

  Future<void> updateProfile() async {
    if (!form.valid) {
      form.markAllAsTouched();
      return;
    }

    if (isUpdatingData) return;

    _isUpdatingData(true);

    try {
      user = await updateProfileUseCase.call(
        id: user.id,
        firstName: form.control('firstName').value as String,
        lastName: form.control('lastName').value as String,
      );

      snackbar.show(
        (ctx) => Snackbars.primary(
          ctx,
          text: localization.tr.profile_userUpdated,
        ),
      );
    } catch (e, s) {
      snackbar.show(
        (ctx) => Snackbars.error(
          ctx,
          text: localization.tr.profile_userUpdated,
        ),
      );

      logError(e, s);
      AppLogger.instance.error(e.toString(), stackTrace: s);
    } finally {
      _isUpdatingData(false);
    }
  }

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }
}

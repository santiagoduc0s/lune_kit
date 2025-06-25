import 'package:flutter/foundation.dart';
import 'package:lune/core/extensions/change_notifier_extension.dart';
import 'package:lune/core/ui/ui.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/domain/repositories/repositories.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SupportNotifier extends ChangeNotifier {
  SupportNotifier({
    required SupportRepository supportRepository,
    required CustomSnackbar snackbar,
    required Localization localization,
  })  : _supportRepository = supportRepository,
        _snackbar = snackbar,
        _localization = localization;

  final SupportRepository _supportRepository;
  final CustomSnackbar _snackbar;
  final Localization _localization;

  bool _isCreatingTicket = false;
  bool get isCreatingTicket => _isCreatingTicket;

  final FormGroup form = FormGroup({
    'email': FormControl<String>(
      value: '',
      validators: [
        Validators.required,
        Validators.email,
      ],
    ),
    'title': FormControl<String>(
      value: '',
      validators: [Validators.required],
    ),
    'description': FormControl<String>(
      value: '',
      validators: [Validators.required],
    ),
  });

  @override
  void dispose() {
    form.dispose();
    super.dispose();
  }

  Future<void> createTicket() async {
    if (!form.valid) {
      form.markAllAsTouched();
      return;
    }

    if (_isCreatingTicket) return;

    _isCreatingTicket = true;
    notifyListeners();

    try {
      await _supportRepository.createTicket(
        email: form.control('email').value as String,
        title: form.control('title').value as String,
        description: form.control('description').value as String,
      );

      primarySnackbar(
        _snackbar,
        _localization.tr.ticketCreated,
      );

      form.reset();
    } catch (e, s) {
      logError(e, s);
      errorSnackbar(_snackbar, _localization.tr.generalError);
    } finally {
      _isCreatingTicket = false;
      notifyListeners();
    }
  }
}

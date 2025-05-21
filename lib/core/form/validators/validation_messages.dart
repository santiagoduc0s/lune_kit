import 'package:lune/core/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

final Map<String, String Function(Object)> validationMessages = {
  ValidationMessage.any: (error) =>
      Injector.findSingleton<Localization>().tr.validation_any,
  ValidationMessage.compare: (error) =>
      Injector.findSingleton<Localization>().tr.validation_compare,
  ValidationMessage.contains: (error) =>
      Injector.findSingleton<Localization>().tr.validation_contains,
  ValidationMessage.creditCard: (error) =>
      Injector.findSingleton<Localization>().tr.validation_creditCard,
  ValidationMessage.email: (error) =>
      Injector.findSingleton<Localization>().tr.validation_email,
  ValidationMessage.equals: (error) =>
      Injector.findSingleton<Localization>().tr.validation_equals,
  ValidationMessage.max: (error) {
    final max = (error as Map<String, dynamic>)['max'] as int;
    return Injector.findSingleton<Localization>().tr.validation_max(max);
  },
  ValidationMessage.maxLength: (error) {
    final requiredLength =
        (error as Map<String, dynamic>)['requiredLength'] as int;
    return Injector.findSingleton<Localization>()
        .tr
        .validation_maxLength(requiredLength);
  },
  ValidationMessage.min: (error) {
    final min = (error as Map<String, dynamic>)['min'] as int;
    return Injector.findSingleton<Localization>().tr.validation_min(min);
  },
  ValidationMessage.minLength: (error) {
    final requiredLength =
        (error as Map<String, dynamic>)['requiredLength'] as int;
    return Injector.findSingleton<Localization>()
        .tr
        .validation_minLength(requiredLength);
  },
  ValidationMessage.mustMatch: (error) =>
      Injector.findSingleton<Localization>().tr.validation_mustMatch,
  ValidationMessage.number: (error) =>
      Injector.findSingleton<Localization>().tr.validation_number,
  ValidationMessage.pattern: (error) =>
      Injector.findSingleton<Localization>().tr.validation_pattern,
  ValidationMessage.required: (error) =>
      Injector.findSingleton<Localization>().tr.validation_required,
  ValidationMessage.requiredTrue: (error) =>
      Injector.findSingleton<Localization>().tr.validation_requiredTrue,
};

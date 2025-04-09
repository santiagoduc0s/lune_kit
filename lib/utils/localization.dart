import 'package:core/core.dart';
import 'package:lune/l10n/l10n.dart';

class Localization {
  Localization._singleton();

  static final instance = Localization._singleton();

  AppLocalizations get tr {
    return AppLocalizations.of(AppKeys.instance.getRootContext()!);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Localization {
  Localization(this.getRootContext);

  BuildContext Function() getRootContext;

  AppLocalizations get tr {
    return AppLocalizations.of(getRootContext());
  }
}

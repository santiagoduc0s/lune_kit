import 'package:flutter/material.dart';
import 'package:lune/l10n/l10n.dart';

class Localization {
  Localization._singleton();

  static final instance = Localization._singleton();

  static late BuildContext buildContext;

  AppLocalizations get tr {
    return AppLocalizations.of(buildContext);
  }
}

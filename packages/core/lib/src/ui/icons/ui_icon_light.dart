import 'package:core/src/ui/assets/assets.dart';
import 'package:core/src/ui/icons/icons.dart';
import 'package:core/src/ui/ui_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Singleton class for UIIconLight.
class UIIconLight implements UIIcon {
  UIIconLight._singleton();

  /// Singleton instance of UIIconLight.
  static final UIIconLight instance = UIIconLight._singleton();

  final UIAsset _assets = UIAssetLight.instance;

  @override
  Widget logo({double? size}) {
    return SvgPicture.asset(
      _assets.logo,
      height: size ?? 10.space,
      width: size ?? 10.space,
    );
  }
}

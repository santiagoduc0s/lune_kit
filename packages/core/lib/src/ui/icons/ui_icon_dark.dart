import 'package:core/src/ui/assets/assets.dart';
import 'package:core/src/ui/icons/icons.dart';
import 'package:core/src/ui/ui_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// The dark theme implementation of [UIIcon].
class UIIconDark extends UIIcon {
  UIIconDark._singleton();

  /// Singleton instance of [UIIconDark].
  static final UIIconDark instance = UIIconDark._singleton();

  final UIAsset _assets = UIAssetDark.instance;

  @override
  Widget logo({double? size}) {
    return SvgPicture.asset(
      _assets.logo,
      height: size ?? 10.space,
      width: size ?? 10.space,
    );
  }
}

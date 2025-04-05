import 'package:core/src/ui/assets/assets.dart';
import 'package:core/src/ui/colors/colors.dart';
import 'package:core/src/ui/icons/icons.dart';
import 'package:core/src/ui/styles/styles.dart';
import 'package:flutter/material.dart';

/// Extension on [ThemeData] to provide access to UI based on the current theme.
extension ThemeDataExtension on ThemeData {
  /// Access icons based on the current theme.
  UIIcon get icons {
    final isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      return UIIconDark.instance;
    } else {
      return UIIconLight.instance;
    }
  }

  /// Access colors based on the current theme.
  UIColor get colors {
    final isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      return UIColorDark.instance;
    } else {
      return UIColorLight.instance;
    }
  }

  /// Access assets based on the current theme.
  UIAsset get assets {
    final isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      return UIAssetDark.instance;
    } else {
      return UIAssetLight.instance;
    }
  }

  /// Access button styles based on the current theme.
  UIButtonStyle get buttonStyles {
    final isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      return UIButtonStyleDark.instance;
    } else {
      return UIButtonStyleLight.instance;
    }
  }

  /// Access input styles based on the current theme.
  UIInputStyle get inputStyles {
    final isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      return UIInputStyleDark.instance;
    } else {
      return UIInputStyleLight.instance;
    }
  }

  /// Access text styles based on the current theme.
  UITextStyle get textStyles {
    final isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      return UITextStyleDark.instance;
    } else {
      return UITextStyleLight.instance;
    }
  }
}

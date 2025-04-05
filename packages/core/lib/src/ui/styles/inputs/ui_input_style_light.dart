import 'package:core/src/ui/colors/colors.dart';
import 'package:core/src/ui/styles/inputs/inputs.dart';
import 'package:core/src/ui/ui_spacing.dart';
import 'package:flutter/material.dart';

/// Implements the light theme for [UIInputStyle].
class UIInputStyleLight implements UIInputStyle {
  UIInputStyleLight._singleton();

  /// Singleton instance of [UIInputStyleLight].
  static final UIInputStyleLight instance = UIInputStyleLight._singleton();

  /// Singleton instance of [UIColor].
  UIColor uiColor = UIColorLight.instance;

  @override
  InputDecoration get primary => InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: uiColor.onSurfaceVariant),
          borderRadius: BorderRadius.circular(3.space),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: uiColor.primary),
          borderRadius: BorderRadius.circular(3.space),
        ),
      );
}

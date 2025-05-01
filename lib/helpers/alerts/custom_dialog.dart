import 'package:core/core.dart';
import 'package:flutter/material.dart';

/// A singleton class for displaying custom dialog boxes
/// in a Flutter application.
class CustomDialog {
  CustomDialog._singleton();

  /// The singleton instance of [CustomDialog].
  static final CustomDialog instance = CustomDialog._singleton();

  /// Shows a dialog to confirm an action.
  Future<bool> confirm({
    BuildContext? buildContext,
    Widget? title,
    Widget? content,
    List<Widget>? actions,
    EdgeInsets? titlePadding,
    EdgeInsets? contentPadding,
    EdgeInsets? actionsPadding,
    Color? backgroundColor,
    Color? surfaceTintColor,
    Color? shadowColor,
    bool barrierDismissible = true,
  }) async {
    final value = await show<bool>(
      buildContext: buildContext,
      title: title,
      content: content,
      actions: actions,
      titlePadding: titlePadding,
      contentPadding: contentPadding,
      actionsPadding: actionsPadding,
      backgroundColor: backgroundColor,
      surfaceTintColor: surfaceTintColor,
      shadowColor: shadowColor,
      barrierDismissible: barrierDismissible,
    );

    return value != null && value == true;
  }

  /// Shows a dialog with the given parameters.
  Future<T?> show<T>({
    BuildContext? buildContext,
    Widget? title,
    Widget? content,
    List<Widget>? actions,
    EdgeInsets? titlePadding,
    EdgeInsets? contentPadding,
    EdgeInsets? actionsPadding,
    Color? backgroundColor,
    Color? surfaceTintColor,
    Color? shadowColor,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      barrierDismissible: barrierDismissible,
      context: buildContext ?? AppGlobalKey.getRootContext()!,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: title != null
              ? titlePadding ??
                  EdgeInsets.symmetric(
                    horizontal: 6.space,
                    vertical: 5.space,
                  )
              : EdgeInsets.zero,
          contentPadding: content != null
              ? contentPadding ??
                  EdgeInsets.symmetric(
                    horizontal: 6.space,
                  )
              : EdgeInsets.zero,
          actionsPadding: actions != null
              ? actionsPadding ??
                  EdgeInsets.symmetric(
                    horizontal: 6.space,
                    vertical: 5.space,
                  )
              : EdgeInsets.zero,
          title: title,
          content: content,
          actions: actions,
          backgroundColor: backgroundColor,
          surfaceTintColor: surfaceTintColor,
          shadowColor: shadowColor,
        );
      },
    );
  }
}

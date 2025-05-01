import 'package:flutter/material.dart';
import 'package:lune/extensions/extensions.dart';

abstract class Dialogs {
  static AlertDialog confirm(
    BuildContext context, {
    required String message,
    required String confirmText,
    required String cancelText,
    bool? barrierDismissible,
  }) {
    final buttons = context.buttonStyles;
    final texts = context.textStyles;

    return AlertDialog(
      title: Text(
        message,
        style: texts.bodyLarge,
      ),
      actions: [
        TextButton(
          style: buttons.primaryText,
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(cancelText),
        ),
        FilledButton(
          style: buttons.primaryFilled,
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(confirmText),
        ),
      ],
    );
  }

  static AlertDialog info(
    BuildContext context, {
    required String message,
    required String confirmText,
    bool? barrierDismissible,
  }) {
    final buttons = context.buttonStyles;
    final texts = context.textStyles;

    return AlertDialog(
      title: Text(
        message,
        style: texts.bodyLarge,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        FilledButton(
          style: buttons.primaryFilled,
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(confirmText),
        ),
      ],
    );
  }
}

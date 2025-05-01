import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/extensions/extensions.dart';
import 'package:lune/helpers/helpers.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  PermissionHelper._singleton();

  static final PermissionHelper instance = PermissionHelper._singleton();

  Future<bool> isAvailable({
    required Permission permission,
  }) async {
    final status = await permission.status;

    if (status.isPermanentlyDenied || status.isDenied || status.isRestricted) {
      return false;
    }
    return true;
  }

  Future<bool> requestPermission({
    required Permission permission,
    String? title,
    String? message,
    String? openButtonText,
    bool showRequiredDialog = false,
  }) async {
    final status = await permission.request();

    if (status.isPermanentlyDenied || status.isDenied || status.isRestricted) {
      if (showRequiredDialog) {
        final isConfirmed = await showDeniedDialog(
          title: title,
          message: message,
          openButtonText: openButtonText,
        );

        if (isConfirmed) {
          await openAppSettings();
        }
      }

      return false;
    }
    return true;
  }

  Future<bool> showDeniedDialog({
    String? title,
    String? message,
    String? openButtonText,
  }) async {
    final localization = Injector.findSingleton<Localization>();
    final l10n = localization.tr;

    final context = AppGlobalKey.getRootContext()!;

    if (!context.mounted) {
      throw Exception('Context is not mounted');
    }

    final buttonsProvider = context.buttonStyles;

    return CustomDialog.instance.confirm(
      title: title != null ? Text(title) : null,
      content: message != null ? Text(message) : null,
      actions: [
        TextButton(
          style: buttonsProvider.primaryText,
          onPressed: () => context.pop(false),
          child: Text(l10n.cancel),
        ),
        FilledButton(
          style: buttonsProvider.primaryFilled,
          onPressed: () {
            context.pop(true);
          },
          child: Text(openButtonText ?? l10n.open),
        ),
      ],
    );
  }
}

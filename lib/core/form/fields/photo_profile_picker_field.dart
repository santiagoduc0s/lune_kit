import 'dart:io';
import 'package:flutter/foundation.dart'; // added to check kIsWeb
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lune/core/extensions/extensions.dart';
import 'package:lune/core/form/fields/reactive_image_picker_field.dart';
import 'package:lune/core/ui/alerts/dialog/dialog.dart';
import 'package:lune/core/ui/alerts/snackbar/snackbar.dart';
import 'package:lune/core/ui/spacing/spacing.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/domain/usecases/permission/permission.dart';
import 'package:lune/l10n/l10n.dart';

class PhotoProfilePickerField extends StatelessWidget {
  const PhotoProfilePickerField({
    required this.formControlName,
    required this.snackbar,
    required this.checkPermissionUseCase,
    required this.requestPermissionUseCase,
    required this.openSettingsUseCase,
    required this.dialog,
    required this.localization,
    super.key,
    this.imageQuality,
    this.size,
  });

  final String formControlName;
  final CustomSnackbar snackbar;
  final int? imageQuality;
  final double? size;

  final CheckPermissionUseCase checkPermissionUseCase;
  final RequestPermissionUseCase requestPermissionUseCase;
  final OpenSettingsUseCase openSettingsUseCase;
  final CustomDialog dialog;
  final Localization localization;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    return ReactiveImagePickerField(
      formControlName: formControlName,
      imageQuality: imageQuality ?? 90,
      onError: (e) {
        snackbar.show(
          ErrorSnackBar(
            text: l10n.generalError,
          ),
        );
      },
      checkPermissionUseCase: checkPermissionUseCase,
      openSettingsUseCase: openSettingsUseCase,
      requestPermissionUseCase: requestPermissionUseCase,
      dialog: dialog,
      localization: localization,
      builder: (
        context,
        file,
        isLoading,
        pickGallery,
        pickCamera,
        removeImage,
      ) {
        final photo = file?.path;

        return Stack(
          children: [
            Container(
              width: size ?? 30.space,
              height: size ?? 30.space,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.primaryContainer,
              ),
              child: AnimatedSwitcher(
                duration: 300.ms,
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: animation,
                      child: child,
                    ),
                  );
                },
                child: photo != null
                    ? ClipOval(
                        key: const ValueKey('photo'),
                        child: kIsWeb
                            ? Image.network(
                                photo,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              )
                            : Image.file(
                                File(photo),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                      )
                    : Center(
                        key: const ValueKey('icon'),
                        child: Icon(
                          Icons.person,
                          size: 15.space,
                        ),
                      ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: PopupMenuButton(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(10.space),
                color: colors.surface,
                padding: EdgeInsets.zero,
                menuPadding: EdgeInsets.zero,
                offset: Offset(-2.space, 2.space),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'gallery',
                    child: Text(l10n.gallery),
                  ),
                  if (!kIsWeb)
                    PopupMenuItem(
                      value: 'camera',
                      child: Text(l10n.takePicture),
                    ),
                  if (photo != null)
                    PopupMenuItem(
                      value: 'delete',
                      child: Text(l10n.deletePicture),
                    ),
                ],
                onSelected: (value) {
                  switch (value) {
                    case 'gallery':
                      pickGallery();
                      break;
                    case 'camera':
                      pickCamera();
                      break;
                    case 'delete':
                      removeImage();
                      break;
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: colors.onPrimary,
                      width: 0.5.space,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 5.space,
                    child: AnimatedSwitcher(
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                            scale: animation,
                            child: child,
                          ),
                        );
                      },
                      child: !isLoading
                          ? Icon(
                              Icons.edit,
                              size: 5.space,
                            )
                          : SizedBox(
                              width: 5.space,
                              height: 5.space,
                              child: CircularProgressIndicator(
                                strokeWidth: 1.space,
                                color: colors.onSurface,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lune/core/ui/alerts/dialog/dialog.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/domain/entities/entities.dart';
import 'package:lune/domain/usecases/permission/permission.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveImagePickerField extends ReactiveFormField<XFile?, XFile?> {
  ReactiveImagePickerField({
    required String formControlName,
    required this.builder,
    required this.checkPermissionUseCase,
    required this.requestPermissionUseCase,
    required this.openSettingsUseCase,
    required this.dialog,
    required this.localization,
    super.key,
    this.imageQuality = 90,
    this.onError,
  }) : super(
          formControlName: formControlName,
          builder: (field) => _ImagePickerContent(
            field: field,
            imageQuality: imageQuality,
            customBuilder: builder,
            onError: onError,
            checkPermissionUseCase: checkPermissionUseCase,
            requestPermissionUseCase: requestPermissionUseCase,
            openSettingsUseCase: openSettingsUseCase,
            dialog: dialog,
            localization: localization,
          ),
        );

  final int imageQuality;
  final Widget Function(
    BuildContext context,
    XFile? image,
    bool isProcessing,
    VoidCallback pickFromGallery,
    VoidCallback pickFromCamera,
    VoidCallback removeImage,
  ) builder;

  final void Function(Object error)? onError;
  final CheckPermissionUseCase checkPermissionUseCase;
  final RequestPermissionUseCase requestPermissionUseCase;
  final OpenSettingsUseCase openSettingsUseCase;
  final CustomDialog dialog;
  final Localization localization;
}

class _ImagePickerContent extends StatefulWidget {
  const _ImagePickerContent({
    required this.field,
    required this.imageQuality,
    required this.customBuilder,
    required this.checkPermissionUseCase,
    required this.requestPermissionUseCase,
    required this.openSettingsUseCase,
    required this.dialog,
    required this.localization,
    this.onError,
  });

  final ReactiveFormFieldState<XFile?, XFile?> field;
  final int imageQuality;
  final Widget Function(
    BuildContext context,
    XFile? image,
    bool isProcessing,
    VoidCallback pickFromGallery,
    VoidCallback pickFromCamera,
    VoidCallback removeImage,
  ) customBuilder;
  final void Function(Object error)? onError;
  final CheckPermissionUseCase checkPermissionUseCase;
  final RequestPermissionUseCase requestPermissionUseCase;
  final OpenSettingsUseCase openSettingsUseCase;
  final CustomDialog dialog;
  final Localization localization;

  @override
  State<_ImagePickerContent> createState() => _ImagePickerContentState();
}

class _ImagePickerContentState extends State<_ImagePickerContent> {
  bool _isProcessing = false;

  Future<void> _pickImage(ImageSource source) async {
    setState(() => _isProcessing = true);

    final permissionType = source == ImageSource.camera
        ? PermissionType.camera
        : PermissionType.photos;

    try {
      var status = await widget.checkPermissionUseCase.call(permissionType);

      if (!mounted) return;

      if (status == PermissionStatus.permanentlyDenied) {
        final shouldOpen = await widget.dialog.confirm(
          message: source == ImageSource.camera
              ? widget.localization.tr.cameraIsDisabled
              : widget.localization.tr.galleryIsDisabled,
          confirmText: widget.localization.tr.goToSettings,
          cancelText: widget.localization.tr.cancel,
        );

        if (shouldOpen) {
          await widget.openSettingsUseCase.call();
        }
        return;
      }

      if (status == PermissionStatus.denied) {
        status = await widget.requestPermissionUseCase.call(permissionType);
      }

      if (status == PermissionStatus.granted) {
        final picker = ImagePicker();
        final image = await picker.pickImage(
          source: source,
          imageQuality: widget.imageQuality,
        );
        if (image != null) {
          widget.field.didChange(image);
        }
      }
    } catch (e) {
      widget.onError?.call(e);
    } finally {
      if (mounted) setState(() => _isProcessing = false);
    }
  }

  void _removeImage() {
    widget.field.didChange(null);
    widget.field.control.markAsTouched();
  }

  Future<void> _pickFromGallery() => _pickImage(ImageSource.gallery);
  Future<void> _pickFromCamera() => _pickImage(ImageSource.camera);

  @override
  Widget build(BuildContext context) {
    final image = widget.field.value;
    return widget.customBuilder(
      context,
      image,
      _isProcessing,
      _pickFromGallery,
      _pickFromCamera,
      _removeImage,
    );
  }
}

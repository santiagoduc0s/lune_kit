import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveImagePickerField extends ReactiveFormField<XFile?, XFile?> {
  ReactiveImagePickerField({
    required String formControlName,
    required this.builder,
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
          ),
        );

  final int imageQuality;

  final Widget Function(
    BuildContext,
    XFile?,
    bool,
    VoidCallback,
    VoidCallback,
    VoidCallback,
  ) builder;

  final void Function()? onError;
}

class _ImagePickerContent extends StatefulWidget {
  const _ImagePickerContent({
    required this.field,
    required this.imageQuality,
    required this.customBuilder,
    this.onError,
  });

  final ReactiveFormFieldState<XFile?, XFile?> field;
  final int imageQuality;
  final Widget Function(
    BuildContext,
    XFile?,
    bool,
    VoidCallback,
    VoidCallback,
    VoidCallback,
  ) customBuilder;

  final void Function()? onError;

  @override
  State<_ImagePickerContent> createState() => _ImagePickerContentState();
}

class _ImagePickerContentState extends State<_ImagePickerContent> {
  bool _isProcessing = false;

  Future<void> _pickImage(ImageSource source) async {
    setState(() => _isProcessing = true);
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(
        source: source,
        imageQuality: widget.imageQuality,
      );
      if (image != null) {
        widget.field.didChange(image);
      }
    } catch (e) {
      widget.onError?.call();
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

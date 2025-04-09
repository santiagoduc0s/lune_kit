import 'package:core/src/app_keys.dart';
import 'package:core/src/ui/ui_spacing.dart';
import 'package:flutter/material.dart';

/// A singleton class for displaying custom bottom modal sheets.
class CustomBottomModal {
  CustomBottomModal._singleton();

  /// The singleton instance of [CustomBottomModal].
  static final CustomBottomModal instance = CustomBottomModal._singleton();

  /// Shows a modal bottom sheet with the given [child] widget.
  Future<T?> show<T>({
    required Widget child,
    bool useFullHeight = false,
    bool useSafeArea = true,
    bool isScrollControlled = false,
    BorderRadius? borderRadius,
    bool isDismissible = true,
  }) {
    return showModalBottomSheet<T>(
      isDismissible: isDismissible,
      useSafeArea: useSafeArea,
      context: AppKeys.instance.getRootContext()!,
      isScrollControlled: isScrollControlled || useFullHeight,
      builder: (BuildContext context) {
        final height = MediaQuery.of(context).size.height;

        return Container(
          height: useFullHeight ? height : null,
          decoration: BoxDecoration(
            borderRadius: borderRadius = BorderRadius.only(
              topLeft: Radius.circular(4.space),
              topRight: Radius.circular(4.space),
            ),
          ),
          child: child,
        );
      },
    );
  }
}

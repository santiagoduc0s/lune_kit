import 'package:core/src/app_keys.dart';
import 'package:core/src/ui/ui.dart';
import 'package:flutter/material.dart';

/// A singleton class for displaying custom snackbars.
class CustomSnackbar {
  CustomSnackbar._singleton();

  /// The singleton instance of [CustomSnackbar].
  static final CustomSnackbar instance = CustomSnackbar._singleton();

  /// A flag to indicate if a snackbar is currently active.
  bool isSnackbarActive = false;

  /// Shows a snackbar with the given [snackBar] content.
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    SnackBar snackBar,
  ) {
    hideSnackBar();

    final currentState = AppKeys.instance.scaffoldMessengerKey.currentState;

    return currentState!.showSnackBar(snackBar);
  }

  /// Hides the currently displayed snackbar.
  void hideSnackBar() {
    final currentState = AppKeys.instance.scaffoldMessengerKey.currentState;

    if (currentState == null) return;

    currentState.hideCurrentSnackBar();
  }

  /// Displays an info snackbar with the given parameters.
  void info({
    bool showIcon = true,
    bool showCloseButton = true,
    bool force = true,
    String? text,
    Color? backgroundColor,
    Color? textColor,
    Widget? content,
    Widget? icon,
    Duration? duration,
    TextStyle? textStyle,
    EdgeInsets? padding,
    EdgeInsets? contentPadding,
    List<BoxShadow>? boxShadow,
    BorderRadius? borderRadius,
    void Function()? onTap,
  }) {
    final context = AppKeys.instance.getRootContext();

    if (context == null) return;

    final colorsProvider = Theme.of(context).colors;

    show(
      showIcon: showIcon,
      showCloseButton: showCloseButton,
      force: force,
      text: text,
      backgroundColor: colorsProvider.primary,
      textColor: textColor,
      content: content,
      icon: icon,
      duration: duration,
      textStyle: textStyle,
      padding: padding,
      contentPadding: contentPadding,
      boxShadow: boxShadow,
      borderRadius: borderRadius,
      onTap: onTap,
    );
  }

  /// Displays an error snackbar with the given parameters.
  void error({
    bool showIcon = true,
    bool showCloseButton = true,
    bool force = true,
    String? text,
    Color? backgroundColor,
    Color? textColor,
    Widget? content,
    Widget? icon,
    Duration? duration,
    TextStyle? textStyle,
    EdgeInsets? padding,
    EdgeInsets? contentPadding,
    List<BoxShadow>? boxShadow,
    BorderRadius? borderRadius,
    void Function()? onTap,
  }) {
    final context = AppKeys.instance.getRootContext();

    if (context == null) return;

    final colorsProvider = Theme.of(context).colors;

    show(
      showIcon: showIcon,
      showCloseButton: showCloseButton,
      force: force,
      text: text,
      backgroundColor: colorsProvider.error,
      textColor: textColor,
      content: content,
      icon: icon,
      duration: duration,
      textStyle: textStyle,
      padding: padding,
      contentPadding: contentPadding,
      boxShadow: boxShadow,
      borderRadius: borderRadius,
      onTap: onTap,
    );
  }

  /// Displays a snackbar with the given parameters.
  void show({
    bool showIcon = true,
    bool showCloseButton = true,
    bool force = true,
    String? text,
    Color? backgroundColor,
    Color? textColor,
    Widget? content,
    Widget? icon,
    Duration? duration,
    TextStyle? textStyle,
    EdgeInsets? padding,
    EdgeInsets? contentPadding,
    List<BoxShadow>? boxShadow,
    BorderRadius? borderRadius,
    void Function()? onTap,
  }) {
    final context = AppKeys.instance.getRootContext();

    if (context == null) return;

    if (!force) {
      if (isSnackbarActive) return;
    }

    isSnackbarActive = true;

    final colorsProvider = Theme.of(context).colors;
    final textStylesProvider = Theme.of(context).textStyles;

    final bgColor = backgroundColor ?? colorsProvider.primary;

    showSnackBar(
      SnackBar(
        backgroundColor: UIColor.transparent,
        elevation: UISpacing.zero,
        padding: EdgeInsets.zero,
        duration: duration ?? const Duration(seconds: 5),
        content: GestureDetector(
          onTap: onTap,
          child: content ??
              Padding(
                padding: padding ??
                    EdgeInsets.symmetric(
                      horizontal: 4.space,
                      vertical: 4.space,
                    ),
                child: Container(
                  padding: contentPadding ??
                      EdgeInsets.only(
                        left: 4.space,
                        right: 4.space,
                        top: 4.space,
                        bottom: 4.space,
                      ),
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: borderRadius ??
                        BorderRadius.circular(
                          1.space,
                        ),
                    boxShadow: boxShadow ??
                        [
                          BoxShadow(
                            color: colorsProvider.shadow.withValues(alpha: 0.3),
                            spreadRadius: 0.25.space,
                            blurRadius: 1.space,
                            offset: const Offset(0, 2),
                          ),
                        ],
                  ),
                  child: Row(
                    children: [
                      if (text != null)
                        Expanded(
                          child: Text(
                            text,
                            style: textStyle ??
                                textStylesProvider.bodySmall.copyWith(
                                  color: textColor ?? colorsProvider.onPrimary,
                                ),
                          ),
                        ),
                      if (showCloseButton)
                        SizedBox(
                          width: 5.space,
                          height: 5.space,
                          child: IconButton(
                            onPressed: hideSnackBar,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: Icon(
                              Icons.close,
                              color: colorsProvider.onPrimary,
                              size: 2.5.space,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
        ),
      ),
    ).closed.then((SnackBarClosedReason reason) {
      isSnackbarActive = false;
    });
  }
}

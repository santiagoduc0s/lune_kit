import 'package:flutter/material.dart';
import 'package:lune/core/extensions/extensions.dart';
import 'package:lune/core/ui/spacing/spacing.dart';

/// Type of button to be used in [LoadingButton].
enum ButtonType {
  /// elevated
  elevated,

  /// filled
  filled,

  /// tonal
  tonal,

  /// outlined
  outlined,

  /// text
  text;
}

/// A button that shows a loading indicator without changing its size.
class LoadingButton extends StatefulWidget {
  /// Creates a [LoadingButton].
  const LoadingButton({
    required this.child,
    required this.type,
    super.key,
    this.isLoading = false,
    this.duration = const Duration(milliseconds: 300),
    this.onPressed,
    this.style,
    this.loader,
    this.strokeWidth,
    this.loaderColor,
    this.transitionBuilder,
  });

  /// Whether the button is in loading state.
  final bool isLoading;

  /// The child widget to be displayed inside the button.
  final Widget child;

  /// The type of button to be used.
  final ButtonType type;

  /// Callback function to be called when the button is pressed.
  final VoidCallback? onPressed;

  /// The style of the button.
  final ButtonStyle? style;

  /// The loader widget to be displayed when the button is loading.
  final Widget? loader;

  /// The stroke width of the loader.
  final double? strokeWidth;

  /// The color of the loader.
  final Color? loaderColor;

  /// The transition builder for the loading animation.
  final AnimatedSwitcherTransitionBuilder? transitionBuilder;

  /// The duration of the loading animation.
  final Duration duration;

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  double _childHeight = 0;
  double _childWidth = 0;
  final GlobalKey _childKey = GlobalKey(debugLabel: 'loading-button');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateChildSize());
  }

  void _updateChildSize() {
    final renderBox =
        _childKey.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox == null || !context.mounted) return;

    setState(() {
      _childHeight = renderBox.size.height;
      _childWidth = renderBox.size.width;
    });
  }

  Widget _defaultFadeTransition(Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  void _onPressed() {
    if (widget.isLoading) return;
    widget.onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    final colorsProvider = context.colors;

    final childWidget = SizedBox(
      key: _childHeight == 0 ? _childKey : UniqueKey(),
      child: widget.child,
    );

    final content = AnimatedSwitcher(
      duration: widget.duration,
      transitionBuilder: widget.transitionBuilder ?? _defaultFadeTransition,
      child: widget.isLoading
          ? SizedBox(
              width: _childWidth,
              height: _childHeight,
              child: SizedBox(
                width: _childHeight,
                height: _childHeight,
                child: widget.loader ??
                    FittedBox(
                      child: CircularProgressIndicator(
                        strokeWidth: widget.strokeWidth ?? 0.25.space,
                        color: widget.loaderColor ?? colorsProvider.onPrimary,
                      ),
                    ),
              ),
            )
          : childWidget,
    );

    if (widget.type == ButtonType.elevated) {
      return ElevatedButton(
        onPressed: widget.onPressed == null ? null : _onPressed,
        style: widget.style,
        child: content,
      );
    }

    if (widget.type == ButtonType.outlined) {
      return OutlinedButton(
        onPressed: widget.onPressed == null ? null : _onPressed,
        style: widget.style,
        child: content,
      );
    }

    if (widget.type == ButtonType.text) {
      return TextButton(
        onPressed: widget.onPressed == null ? null : _onPressed,
        style: widget.style,
        child: content,
      );
    }

    if (widget.type == ButtonType.tonal) {
      return FilledButton.tonal(
        onPressed: widget.onPressed == null ? null : _onPressed,
        style: widget.style,
        child: content,
      );
    }

    if (widget.type == ButtonType.filled) {
      return FilledButton(
        onPressed: widget.onPressed == null ? null : _onPressed,
        style: widget.style,
        child: content,
      );
    }

    throw Exception('Button type not supported');
  }
}

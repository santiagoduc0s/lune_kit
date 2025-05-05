import 'package:flutter/material.dart';
import 'package:lune/core/extensions/extensions.dart';
import 'package:lune/core/ui/spacing/spacing.dart';

class Snackbars {
  static SnackBar primary(
    BuildContext context, {
    required String text,
    void Function()? onTap,
  }) {
    final colorsProvider = context.colors;
    final textStylesProvider = context.textStyles;

    final bgColor = colorsProvider.primary;

    return SnackBar(
      backgroundColor: Colors.transparent,
      elevation: UISpacing.zero,
      padding: EdgeInsets.zero,
      duration: const Duration(seconds: 5),
      content: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 4.space,
            vertical: 4.space,
          ),
          child: Container(
            padding: EdgeInsets.only(
              left: 4.space,
              right: 4.space,
              top: 4.space,
              bottom: 4.space,
            ),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(
                1.space,
              ),
              boxShadow: [
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
                Expanded(
                  child: Text(
                    text,
                    style: textStylesProvider.bodySmall.copyWith(
                      color: colorsProvider.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static SnackBar error(
    BuildContext context, {
    required String text,
    void Function()? onTap,
  }) {
    final colorsProvider = context.colors;
    final textStylesProvider = context.textStyles;

    final bgColor = colorsProvider.error;

    return SnackBar(
      backgroundColor: Colors.transparent,
      elevation: UISpacing.zero,
      padding: EdgeInsets.zero,
      duration: const Duration(seconds: 5),
      content: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 4.space,
            vertical: 4.space,
          ),
          child: Container(
            padding: EdgeInsets.only(
              left: 4.space,
              right: 4.space,
              top: 4.space,
              bottom: 4.space,
            ),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(
                1.space,
              ),
              boxShadow: [
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
                Expanded(
                  child: Text(
                    text,
                    style: textStylesProvider.bodySmall.copyWith(
                      color: colorsProvider.onError,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

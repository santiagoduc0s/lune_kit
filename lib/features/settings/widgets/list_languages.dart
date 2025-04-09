import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lune/l10n/l10n.dart';

class ListLanguages extends StatelessWidget {
  const ListLanguages({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colors = Theme.of(context).colors;

    final textStyles = Theme.of(context).textStyles;

    final buttonStyles = Theme.of(context).buttonStyles;

    final paddingBottom =
        MediaQuery.of(AppKeys.instance.getRootContext()!).padding.bottom;

    return SizedBox(
      child: LoadingButton(
        type: ButtonType.filled,
        onPressed: () async {
          final locale = await CustomBottomModal.instance.show<Locale>(
            isScrollControlled: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 2.space),
                Container(
                  height: 1.space,
                  width: context.screenWidth * 0.1,
                  decoration: BoxDecoration(
                    color: colors.onPrimaryContainer,
                    borderRadius: BorderRadius.circular(
                      1.space,
                    ),
                  ),
                ),
                SizedBox(height: 3.space),
                ListTile(
                  title: Text(
                    l10n.automatic,
                    style: textStyles.bodyLarge,
                  ),
                  onTap: () {
                    context.pop(const Locale('system'));
                  },
                ),
                ListTile(
                  title: Text(
                    l10n.settings_languageEnglish,
                    style: textStyles.bodyLarge,
                  ),
                  onTap: () {
                    context.pop(const Locale('en'));
                  },
                ),
                ListTile(
                  title: Text(
                    l10n.settings_languageSpanish,
                    style: textStyles.bodyLarge,
                  ),
                  onTap: () {
                    context.pop(const Locale('es'));
                  },
                ),
                SizedBox(height: paddingBottom),
              ],
            ),
          );

          if (locale == null) return;

          if (locale == const Locale('system')) {
            AppPreference.instance.setLocale(null);
          } else {
            AppPreference.instance.setLocale(locale);
          }
        },
        style: buttonStyles.primaryFilled,
        child: Text(l10n.settings_language),
      ),
    );
  }
}

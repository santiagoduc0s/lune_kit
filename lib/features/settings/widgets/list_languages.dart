import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lune/extensions/extensions.dart';
import 'package:lune/features/core/app_preference/ui/notifier/notifier.dart';
import 'package:lune/helpers/modals/modals.dart';
import 'package:lune/l10n/l10n.dart';
import 'package:lune/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ListLanguages extends StatelessWidget {
  const ListLanguages({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final colors = context.colors;

    final textStyles = context.textStyles;

    final buttonStyles = context.buttonStyles;

    final paddingBottom =
        MediaQuery.of(AppGlobalKey.getRootContext()!).padding.bottom;

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

          final currentContext = context;
          if (locale == const Locale('system')) {
            if (currentContext.mounted) {
              await currentContext
                  .read<AppPreferenceNotifier>()
                  .setLocale(null);
            }
          } else {
            if (currentContext.mounted) {
              await currentContext
                  .read<AppPreferenceNotifier>()
                  .setLocale(locale);
            }
          }
        },
        style: buttonStyles.primaryFilled,
        child: Text(l10n.settings_language),
      ),
    );
  }
}

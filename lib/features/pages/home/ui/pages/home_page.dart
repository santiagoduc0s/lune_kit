import 'package:flutter/material.dart';
import 'package:lune/core/extensions/extensions.dart';
import 'package:lune/core/ui/ui.dart';
import 'package:lune/core/utils/utils.dart';
import 'package:lune/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final icons = context.icons;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.home),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton(
              onPressed: () {
                Injector.findSingleton<AppSnackbar>().show(
                  snackbar: (context) => Snackbars.error(
                    context,
                    text: 'Hola',
                  ),
                );
              },
              child: const Text('test1'),
            ),
            FilledButton(
              onPressed: () {
                Injector.findSingleton<AppDialog>().confirm(
                  dialog: (context) => Dialogs.confirm(
                    context,
                    message: 'Esta seguro de realizar esta accion?',
                    confirmText: 'Confirmar',
                    cancelText: 'Cancelar',
                  ),
                );
              },
              child: const Text('test2'),
            ),
            FilledButton(
              onPressed: () {
                Injector.findSingleton<AppDialog>().confirm(
                  dialog: (context) => Dialogs.info(
                    context,
                    message: 'Te enviamos un sms con el codigo de validacion',
                    confirmText: 'Confirmar',
                  ),
                );
              },
              child: const Text('test3'),
            ),
            icons.logo(),
          ],
        ),
      ),
    );
  }
}

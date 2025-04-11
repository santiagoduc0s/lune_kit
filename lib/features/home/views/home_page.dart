import 'package:flutter/material.dart';
import 'package:lune/extensions/theme_data_extension.dart';
import 'package:lune/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final icons = Theme.of(context).icons;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.home),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icons.logo(),
          ],
        ),
      ),
    );
  }
}

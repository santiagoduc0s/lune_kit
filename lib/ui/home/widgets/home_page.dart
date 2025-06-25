import 'package:flutter/material.dart';
import 'package:lune/core/extensions/extensions.dart';
import 'package:lune/core/ui/spacing/spacing.dart';
import 'package:lune/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    var paddingTop = context.paddingTop;
    if (paddingTop == 0) {
      paddingTop = 6.space;
    }

    return Scaffold(
      body: Center(
        child: Text(l10n.home),
      ),
    );
  }
}

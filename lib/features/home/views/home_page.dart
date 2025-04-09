import 'package:flutter/material.dart';
import 'package:lune/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.home),
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}

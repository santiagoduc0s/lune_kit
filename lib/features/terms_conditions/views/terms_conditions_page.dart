import 'package:core/core.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TermsConditionsPage extends StatefulWidget {
  const TermsConditionsPage({super.key});

  @override
  State<TermsConditionsPage> createState() => _TermsConditionsPageState();
}

class _TermsConditionsPageState extends State<TermsConditionsPage> {
  String _markdownData = '';

  @override
  void initState() {
    super.initState();
    _loadMarkdown();
  }

  Future<void> _loadMarkdown() async {
    final data = await rootBundle.loadString(Assets.files.termsConditions);

    setState(() {
      _markdownData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textStyles;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
      ),
      body: _markdownData.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Markdown(
              data: _markdownData,
              styleSheet: MarkdownStyleSheet(
                p: textStyles.bodyMedium,
              ),
              onTapLink: (text, href, title) {
                if (href == null) return;
                launchUrlString(href);
              },
            ),
    );
  }
}

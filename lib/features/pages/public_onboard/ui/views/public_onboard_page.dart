import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lune/core/extensions/extensions.dart';
import 'package:lune/core/ui/spacing/spacing.dart';
import 'package:lune/l10n/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PublicOnboardPage extends StatefulWidget {
  const PublicOnboardPage({super.key});

  @override
  State<PublicOnboardPage> createState() => _PublicOnboardPageState();
}

class _PublicOnboardPageState extends State<PublicOnboardPage> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(_onPageScroll);
  }

  void _onPageScroll() {
    final offset = _pageController.offset;
    final viewport = _pageController.position.viewportDimension;
    var page = offset / viewport;

    var wave = math.sin(math.pi * page).abs();
    if (wave < 1e-4) wave = 0.0;
    if (wave < 0.40) {
      page = page.roundToDouble();
    }

    final rounded = page.round();
    if (rounded != _currentIndex) {
      setState(() {
        _currentIndex = rounded;
      });
    }
  }

  @override
  void dispose() {
    _pageController
      ..removeListener(_onPageScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    var bottomPadding = MediaQuery.of(context).padding.bottom;
    if (bottomPadding == 0) {
      bottomPadding = 4.space;
    }

    final pages = [
      SinglePageOnboard(
        title: 'Title 1',
        body: 'Body 1',
        content: Icon(
          Icons.fitness_center,
          size: 15.space,
        ),
      ),
      SinglePageOnboard(
        title: 'Title 2',
        body: 'Body 2',
        content: Icon(
          Icons.fitness_center,
          size: 15.space,
        ),
      ),
      SinglePageOnboard(
        title: 'Title 3',
        body: 'Body 3',
        content: Icon(
          Icons.fitness_center,
          size: 15.space,
        ),
      ),
    ];

    final isLast = _currentIndex == pages.length - 1;

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: pages,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.space),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedSwitcher(
                    duration: 200.ms,
                    transitionBuilder: (child, anim) =>
                        FadeTransition(opacity: anim, child: child),
                    child: !isLast
                        ? TextButton(
                            key: const ValueKey('skip'),
                            onPressed: () => _finishOnboard(context),
                            child: Text(l10n.skip),
                          )
                        : const SizedBox(width: 60),
                  ),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: pages.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: colors.primary,
                      dotColor: colors.inversePrimary,
                      dotHeight: 2.space,
                      dotWidth: 2.space,
                      expansionFactor: 1.space,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (isLast) {
                        _finishOnboard(context);
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder: (child, anim) =>
                          FadeTransition(opacity: anim, child: child),
                      child: Text(
                        isLast ? l10n.done : l10n.next,
                        key: ValueKey(isLast ? 'done' : 'next'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: bottomPadding),
          ],
        ),
      ),
    );
  }

  void _finishOnboard(BuildContext context) {}
}

class SinglePageOnboard extends StatelessWidget {
  const SinglePageOnboard({
    required this.title,
    required this.body,
    required this.content,
    super.key,
  });

  final String title;
  final String body;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        content,
        SizedBox(height: 5.space),
        Text(title),
        SizedBox(height: 3.space),
        Text(body),
      ],
    );
  }
}

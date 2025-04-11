import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lune/extensions/extensions.dart';
import 'package:lune/features/public_onboard/public_onboard.dart';
import 'package:lune/l10n/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PublicOnboardPage extends StatelessWidget {
  const PublicOnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;

    var bottomPadding = MediaQuery.of(context).padding.bottom;
    if (bottomPadding == 0) {
      bottomPadding = 4.space;
    }

    final pageController = context.read<PublicOnboardBloc>().pageController;

    final index = context.select((PublicOnboardBloc bloc) => bloc.state.index);

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

    final isLastPage = index == (pages.length - 1);

    final l10n = context.l10n;

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                children: pages,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.space,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedSwitcher(
                    duration: 200.ms,
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: !isLastPage
                        ? TextButton(
                            key: const ValueKey('skip'),
                            child: Text(l10n.skip),
                            onPressed: () {
                              context
                                  .read<PublicOnboardBloc>()
                                  .add(FinishPublicOnboard());
                            },
                          )
                        : Visibility(
                            visible: false,
                            maintainSize: true,
                            maintainAnimation: true,
                            maintainState: true,
                            child: TextButton(
                              child: Text(l10n.skip),
                              onPressed: () {},
                            ),
                          ),
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
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
                      if (isLastPage) {
                        context
                            .read<PublicOnboardBloc>()
                            .add(FinishPublicOnboard());
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: AnimatedSwitcher(
                      duration: const Duration(
                        milliseconds: 200,
                      ),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      child: isLastPage
                          ? Text(l10n.done, key: const ValueKey('done'))
                          : Text(l10n.next, key: const ValueKey('next')),
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

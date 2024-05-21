import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String text;
  final String? imagePath;
  final VoidCallback onNextPressed;
  final VoidCallback? onPreviousPressed;
  final VoidCallback? onSkipPressed;
  const OnboardingPage(
      {super.key,
      required this.title,
      required this.text,
      this.imagePath,
      required this.onNextPressed,
      this.onPreviousPressed,
      this.onSkipPressed});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: onPreviousPressed,
                      icon: const Icon(FluentIcons.arrow_left_24_regular)),
                  const Spacer(),
                  TextButton(
                    onPressed: onSkipPressed,
                    child: Text(
                      "Skip",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: theme.colorScheme.primary),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                title,
                style: theme.textTheme.headlineLarge!
                    .copyWith(color: theme.colorScheme.primary),
                textAlign: TextAlign.center,
              ),
              const Gap(kPadding16),
              Text(
                text,
                textAlign: TextAlign.center,
              ),
              const Gap(32),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: FittedBox(
              //     child: ZonerButton(
              //       onPressed: () {},
              //       label: "Continue",
              //       icon: FluentIcons.arrow_right_24_regular,
              //     ),
              //   ),
              // ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton.filled(
                  style: IconButton.styleFrom(
                      elevation: 0, fixedSize: const Size.square(64)),
                  onPressed: onNextPressed,
                  icon: const Icon(
                    FluentIcons.arrow_right_24_regular,
                    color: Colors.white,
                  ),
                ),
              ),
              const Gap(kPadding64),
            ],
          ),
        ),
      ),
    );
  }
}

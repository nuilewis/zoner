import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/core.dart';
import '../../shared/components_global/components.dart';

class CheckoutFailedScreen extends StatelessWidget {
  static const String id = "checkout_failed";
  const CheckoutFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    //  final bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding16),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    color: theme.colorScheme.errorContainer,
                    shape: BoxShape.circle),
              ),
              const Gap(kPadding16),
              Text('Payment Failed',
                  style: theme.textTheme.headlineMedium!
                      .copyWith(color: theme.colorScheme.error),
                  textAlign: TextAlign.center),
              const Gap(kPadding16),
              Text('We were unable to process your payment',
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: ZonerColors.neutral50),
                  textAlign: TextAlign.center),
              const Gap(kPadding8),
              Align(
                alignment: Alignment.center,
                child: Text('8500 RWF',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w800,
                        fontFamily: "Plus Jakarta Sans")),
              ),
              const Spacer(),
              ZonerButton(
                onPressed: () {},
                label: "Cancel",
                buttonType: AppButtonType.outline,
              ),
              const Gap(kPadding16),
              ZonerButton(onPressed: () {}, label: "Retry"),
              const Gap(kPadding64),
            ],
          ),
        ),
      ),
    );
  }
}

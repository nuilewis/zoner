import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';
import '../../../shared/components_global/components.dart';

class IncompleteProfileSetupCard extends StatelessWidget {
  const IncompleteProfileSetupCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kPadding16),
      padding: const EdgeInsets.all(kPadding16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kPadding24),
        color: theme.colorScheme.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Finish setting up your profile to get started",
            style: theme.textTheme.bodyLarge!.copyWith(
                color: theme.scaffoldBackgroundColor,
                fontWeight: FontWeight.w600),
          ),
          const Gap(kPadding24),
          Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
              child: ZonerButton(
                  color: theme.scaffoldBackgroundColor,
                  onPressed: () {},
                  buttonType: AppButtonType.outline,
                  isChipButton: true,
                  label: "Lets Go!"),
            ),
          )
        ],
      ),
    );
  }
}

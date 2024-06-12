import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';
import '../../../components_global/components.dart';

class PaymentMethodSelectorItem extends StatelessWidget {
  final VoidCallback onPressed;
  const PaymentMethodSelectorItem({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(kPadding16),
      splashFactory: InkSparkle.splashFactory,
      splashColor: theme.colorScheme.primary.withOpacity(.2),
      child: Ink(
        padding: const EdgeInsets.all(kPadding16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kPadding16),
          border: Border.all(
              color:
                  isDarkMode ? ZonerColors.neutral20 : ZonerColors.neutral90),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(kPadding8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kPadding8),
                color:
                    isDarkMode ? ZonerColors.neutral20 : ZonerColors.neutral95,
              ),
              child: const ZonerIcon(
                icon: FluentIcons.credit_card_clock_24_regular,
                color: ZonerColors.neutral50,
              ),
            ),
            const Gap(kPadding16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Credit Card',
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: ZonerColors.neutral50),
                ),
                const Gap(kPadding8),
                Text(
                  "**** **** **** 1234",
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: ZonerColors.neutral50),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

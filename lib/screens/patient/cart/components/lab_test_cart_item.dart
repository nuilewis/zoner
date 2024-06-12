import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/core/core.dart';

import '../../../components_global/components.dart';

class LabTestCartItem extends StatelessWidget {
  final String testName;
  final String price;
  final VoidCallback onDelete;

  const LabTestCartItem({super.key, 
    required this.testName,
    required this.price,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kPadding24),
        border: Border.all(
            color: isDarkMode ? ZonerColors.neutral20 : ZonerColors.neutral90),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ZonerIcon(
                  icon: FluentIcons.beaker_24_regular,
                  color: theme.colorScheme.primary),
              const Gap(kPadding8),
              Text('Lab Tests',
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: ZonerColors.neutral50)),
              const Spacer(),
              IconButton(
                icon: Icon(FluentIcons.delete_24_regular,
                    color: theme.colorScheme.error),
                onPressed: onDelete,
              ),
            ],
          ),
          const Gap(kPadding8),
          Text(testName,
              style: theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w800,
              )),
          const Gap(kPadding8),
          Text(price,
              style: theme.textTheme.titleMedium!.copyWith(
                  fontFamily: "Plus Jakarta Sans",
                  fontWeight: FontWeight.w800,
                  color: theme.colorScheme.primary)),
        ],
      ),
    );
  }
}

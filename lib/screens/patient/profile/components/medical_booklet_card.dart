import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';
import '../../../shared/components_global/components.dart';

class MedicalBookletCard extends StatelessWidget {
  final bool isPermissionGranted;
  const MedicalBookletCard({super.key, this.isPermissionGranted = false});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(kPadding16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kPadding24),
          border: isPermissionGranted
              ? null
              : Border.all(
                  color: isDarkMode
                      ? ZonerColors.neutral20
                      : ZonerColors.neutral90,
                  width: 1),
          color: isPermissionGranted ? Theme.of(context).primaryColor : null),
      padding: const EdgeInsets.all(kPadding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                FluentIcons.book_24_filled,
                color: isPermissionGranted ? Colors.white : null,
              ),
              const Gap(kPadding8),
              Text(
                "Medical Booklet",
                style: theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: isPermissionGranted ? Colors.white : null),
              )
            ],
          ),
          const Gap(kPadding16),
          Text(
            isPermissionGranted
                ? "View Dave's Medical Booklet"
                : "You don't have permission to view Dave's medical booklet. You can request for access below",
            style: theme.textTheme.bodyMedium!
                .copyWith(color: isPermissionGranted ? Colors.white : null),
          ),
          const Gap(kPadding16),
          Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
              child: ZonerButton(
                onPressed: () {},
                label: isPermissionGranted ? "View Booklet" : "Request Access",
                buttonType: isPermissionGranted
                    ? AppButtonType.primary
                    : AppButtonType.outline,
                color: isPermissionGranted
                    ? Colors.white
                    : theme.colorScheme.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}

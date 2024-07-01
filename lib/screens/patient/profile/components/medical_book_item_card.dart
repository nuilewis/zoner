import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';
import '../../../shared/components_global/components.dart';
import '../../sessions/components/components.dart';

class MedicalBookletItemCard extends StatelessWidget {
  final SessionState sessionState;
  final VoidCallback onPressed;
  final VoidCallback onDownloadPressed;
  const MedicalBookletItemCard(
      {super.key,
      this.sessionState = SessionState.closed,
      required this.onPressed,
      required this.onDownloadPressed});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kPadding16),
      padding: const EdgeInsets.all(kPadding16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kPadding24),
          border: Border.all(
              width: 1,
              color:
                  isDarkMode ? ZonerColors.neutral20 : ZonerColors.neutral90)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DoubleAvatar(
                imagePath1: "assets/images/memoji.png",
                imagePath2: "assets/images/memoji.jpg",
              ),
              const Spacer(),
              Chip(
                label: Text(
                  "Closed",
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: theme.colorScheme.error),
                ),
                backgroundColor:
                    isDarkMode ? ZonerColors.red10 : ZonerColors.red90,
              )
            ],
          ),
          const Gap(kPadding16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Session with Dr Lucy",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  const Gap(kPadding8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(FluentIcons.calendar_24_regular),
                      const Gap(8),
                      Text(
                        "25 May 2023, 9am",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),
              ZonerButton(
                buttonType: AppButtonType.outline,
                onPressed: onPressed,
                label: "View",
                isChipButton: true,
              ),
              const Gap(kPadding8),
              IconButton.filled(
                style: IconButton.styleFrom(
                    backgroundColor: theme.scaffoldBackgroundColor,
                    side: BorderSide(color: theme.colorScheme.primary, width: 1)

                    //   fixedSize: const Size(32, 32),
                    ),
                onPressed: onDownloadPressed,
                icon: Icon(
                  FluentIcons.arrow_down_24_regular,
                  color: theme.colorScheme.primary,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

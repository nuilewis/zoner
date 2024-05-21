import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';
import '../../../components_global/components.dart';
import 'components.dart';

class DoctorSearchResultCard extends StatelessWidget {
  const DoctorSearchResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        // color: theme.cardColor,
        border: Border.all(
            color: isDarkMode ? theme.cardColor : ZonerColors.purple90),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/memoji.jpg"),
                radius: 42,
              ),
              const Gap(kPadding16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr Lucy Lu",
                      style: theme.textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "Generalist",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: ZonerColors.neutral50),
                    ),
                    const Gap(kPadding8),
                    const Wrap(
                      spacing: 24,
                      children: [
                        IconText(
                          label: "12 yrs",
                          icon: FluentIcons.clock_20_filled,
                        ),
                        IconText(
                          label: "4.8",
                          icon: FluentIcons.star_20_filled,
                        ),
                        IconText(
                          label: "68",
                          icon: FluentIcons.people_16_filled,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const Gap(kPadding8),
          ZonerChip(
            color: theme.colorScheme.primary,
            chipType: AppChipType.info,
            label: "Bamenda Regional Hospital",
            iconPath: "assets/svg/hospital-filled.svg",
          )
        ],
      ),
    );
  }
}

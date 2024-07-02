import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/screens/shared/components_global/components.dart';

import '../../../../core/core.dart';
import 'components.dart';

Map<String, String> availabilityData = {
  "Monday": "7:00am - 6:00pm",
  "Tuesday": "7:00am - 6:00pm",
  "Wednesday": "7:00am - 6:00pm",
  "Thursday": "7:00am - 6:00pm",
  "Friday": "7:00am - 6:00pm",
};

class AvailabilityCard extends StatelessWidget {
  final bool isPublicMode;
  const AvailabilityCard({super.key, this.isPublicMode = false});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(kPadding16),
      margin: const EdgeInsets.all(kPadding16),
      decoration: BoxDecoration(
        border: Border.all(
            color: isDarkMode ? ZonerColors.neutral20 : ZonerColors.neutral90,
            width: 1),
        borderRadius: BorderRadius.circular(kPadding24),
        //color: theme.cardColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                FluentIcons.calendar_24_filled,
                color: theme.colorScheme.primary,
              ),
              const Gap(kPadding8),
              Text(
                "Availability",
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w800,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          const Gap(kPadding16),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: (context, index) => AvailabilityTimeListItem(
                  day: availabilityData.keys.toList()[index],
                  availability: availabilityData.values.toList()[index]),
              separatorBuilder: (context, index) => const Gap(kPadding8),
              itemCount: availabilityData.length),
          Visibility(
            visible: isPublicMode,
            child: Column(
              children: [
                const Gap(kPadding16),
                Align(
                  alignment: Alignment.centerRight,
                  child: FittedBox(
                    child: ZonerButton(
                      onPressed: () {},
                      label: "Manage Availability",
                      buttonType: AppButtonType.outline,
                      isChipButton: true,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

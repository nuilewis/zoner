import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../components_global/components.dart';

class ConsultationCard extends StatelessWidget {
  const ConsultationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage("assets/images/memoji.png"),
              ),
              const Gap(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Gap(8),
                  Text(
                    "Consultation with Dr Lucy",
                    style: theme.textTheme.bodyMedium,
                  ),
                  const Gap(8),
                  Row(
                    children: [
                      Icon(
                        FluentIcons.clock_24_regular,
                        color: theme.primaryColor,
                      ),
                      const Gap(8),
                      const Text("8:00 AM - 9:00 AM"),
                    ],
                  )
                ],
              ),
            ],
          ),
          const Gap(8),
          Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
              child: ZonerButton(
                isChipButton: true,
                onPressed: () {},
                label: "View More",
                trailingIcon: FluentIcons.arrow_right_20_regular,
                // icon: FluentIcons.arrow_right_24_regular,
              ),
            ),
          )
        ],
      ),
    );
  }
}

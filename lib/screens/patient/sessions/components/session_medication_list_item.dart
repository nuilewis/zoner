import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';
import '../../../shared/components_global/components.dart';

enum TestAndMedicationType { test, medication }

class SessionMedicationListItem extends StatelessWidget {
  ///Todo:Refactor this widget to take a full medication object
  ///Todo: Also  make this expandable on click to reveal the full medication details
  final String medName;
  final String? dose;

  const SessionMedicationListItem(
      {super.key, required this.medName, this.dose});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kPadding8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(kPadding8),
            decoration: BoxDecoration(
                color:
                    isDarkMode ? ZonerColors.neutral20 : ZonerColors.neutral95,
                shape: BoxShape.circle),
            child: const ZonerIcon(
              size: 20,
              icon: FluentIcons.pill_16_regular,
            ),
          ),
          const Gap(kPadding16),
          Text(medName),
          const Spacer(),
          Text(dose ?? "")
        ],
      ),
    );
  }
}

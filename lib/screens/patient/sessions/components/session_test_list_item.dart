import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';
import '../../../components_global/components.dart';

class SessionTestListItem extends StatelessWidget {
  final String testName;

  const SessionTestListItem({
    super.key,
    required this.testName,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Container(
      ///Todo:Change this into some kind of expandable on click to reveal the full test details and results
      padding: const EdgeInsets.symmetric(vertical: kPadding8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(kPadding8),
            decoration: BoxDecoration(
                color:
                    isDarkMode ? ZonerColors.neutral20 : ZonerColors.neutral95,
                shape: BoxShape.circle),
            child: const ZonerIcon(size: 20, icon: FluentIcons.beaker_16_regular),
          ),
          const Gap(kPadding16),
          Text(testName),
        ],
      ),
    );
  }
}

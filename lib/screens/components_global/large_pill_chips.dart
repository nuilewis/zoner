import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/screens/components_global/components.dart';

import '../../core/core.dart';

class LargePillChips extends StatelessWidget {
  final String label;
  final String? iconPath;
  final IconData? icon;
  final Color? color;
  const LargePillChips(
      {super.key, required this.label, this.iconPath, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return FittedBox(
      child: Container(
        //  height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kPadding48),
            border: Border.all(
                width: 1,
                color: color ??
                    (isDarkMode
                        ? ZonerColors.neutral20
                        : ZonerColors.neutral90))),
        padding: const EdgeInsets.symmetric(
            vertical: kPadding24, horizontal: kPadding32),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: icon != null || iconPath != null,
              child: Row(
                children: [
                  ZonerIcon(
                    iconPath: iconPath,
                    icon: icon,
                    color: color,
                  ),
                  const Gap(4),
                ],
              ),
            ),
            Text(
              label,
              style: theme.textTheme.bodyMedium!.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}

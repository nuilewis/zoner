import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/core.dart';
import 'components.dart';

class HorizontalDetailsItem extends StatelessWidget {
  final IconData? icon;
  final String? iconPath;
  final String label;
  final String content;
  final Color? color;
  const HorizontalDetailsItem(
      {super.key,
      this.icon,
      this.iconPath,
      required this.label,
      required this.content,
      this.color});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kPadding12),
      decoration: BoxDecoration(
          border: Border.symmetric(
              vertical: BorderSide(
                  color: isDarkMode
                      ? ZonerColors.neutral50
                      : ZonerColors.neutral90,
                  width: 1))),
      child: Row(
        children: [
          ZonerIcon(
            icon: icon,
            iconPath: iconPath,
            color: ZonerColors.neutral50,
          ),
          const Gap(kPadding8),
          Text(
            label,
            style: theme.textTheme.bodyMedium!
                .copyWith(color: ZonerColors.neutral50),
          ),
          const Spacer(),
          Text(
            content,
            style: theme.textTheme.bodyMedium!
                .copyWith(color: color, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';

class ConsultationCTACard extends StatelessWidget {
  final Color? backgroundColor;
  final Color? labelColor;
  final String? label;
  final VoidCallback onPressed;
  const ConsultationCTACard(
      {super.key,
        this.backgroundColor,
        this.labelColor,
        this.label,
        required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(32),
      splashFactory: InkSparkle.splashFactory,
      splashColor: labelColor?.withOpacity(.2) ??
          theme.colorScheme.primary.withOpacity(.2),
      onTap: onPressed,
      child: Ink(
        width: MediaQuery.sizeOf(context).width * .6,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: backgroundColor ?? theme.colorScheme.secondaryContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: theme.scaffoldBackgroundColor),
              child: Icon(
                FluentIcons.stethoscope_24_regular,
                color: labelColor ?? ZonerColors.yellow60,
              ),
            ),
            const Gap(144),
            Text(
              label ?? "Consult\nwith Doctor",
              style: theme.textTheme.headlineSmall!.copyWith(height: 1.2),
            ),
          ],
        ),
      ),
    );
  }
}

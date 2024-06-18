import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/core.dart';

class ProfileImageAppBar extends StatelessWidget {
  const ProfileImageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Row(
      children: [
        const CircleAvatar(
          radius: 32,
          backgroundImage: AssetImage("assets/images/memoji.jpg"),
        ),
        const Gap(kPadding16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Welcome",
              style: theme.textTheme.bodyMedium,
            ),
            const Gap(4),
            Text("Dr Lucy Lu",
                style: theme.textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w800)),
          ],
        ),
        const Spacer(),
        IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor:
                  isDarkMode ? ZonerColors.neutral20 : ZonerColors.neutral95,
            ),
            onPressed: () {},
            icon: const Icon(FluentIcons.list_rtl_20_regular))
      ],
    );
  }
}

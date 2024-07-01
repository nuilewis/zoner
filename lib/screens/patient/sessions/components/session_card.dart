import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';
import '../../../shared/components_global/components.dart';
import 'double_avatar.dart';

enum SessionState { request, ongoing, completed, closed }

class SessionCard extends StatelessWidget {
  final SessionState sessionState;
  final EdgeInsetsGeometry? margin;
  final VoidCallback onPressed;
  const SessionCard(
      {super.key,
      this.sessionState = SessionState.ongoing,
      this.margin,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    BoxDecoration sessionDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(kPadding24),
        border: Border.all(
            width: 1,
            color: isDarkMode ? ZonerColors.neutral20 : ZonerColors.neutral90));

    switch (sessionState) {
      case SessionState.ongoing:
        sessionDecoration = BoxDecoration(
          borderRadius: BorderRadius.circular(kPadding24),
          color: theme.cardColor,
        );

      default:
        sessionDecoration = BoxDecoration(
            borderRadius: BorderRadius.circular(kPadding24),
            border: Border.all(
                width: 1,
                color: isDarkMode
                    ? ZonerColors.neutral20
                    : ZonerColors.neutral90));
    }

    return Container(
      margin: margin,
      width: MediaQuery.sizeOf(context).width * .8,
      padding: const EdgeInsets.all(kPadding16),
      decoration: sessionDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DoubleAvatar(
            imagePath1: "assets/images/memoji.png",
            imagePath2: "assets/images/memoji.jpg",
          ),
          const Gap(kPadding8),
          Visibility(
              visible: sessionState == SessionState.request,
              child: const Text("Session with Dr Lucy")),
          const Gap(kPadding8),
          Visibility(
            visible: sessionState == SessionState.request,
            replacement: Row(
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
                  onPressed: onPressed,
                  label: "View",
                  isChipButton: true,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                FittedBox(
                  child: ZonerButton(
                      buttonType: AppButtonType.text,
                      color: theme.colorScheme.error,
                      onPressed: () {
                        ///Todo: Decline session request
                      },
                      isChipButton: true,
                      label: "Decline"),
                ),
                const Gap(kPadding16),
                FittedBox(
                  child: ZonerButton(
                      buttonType: AppButtonType.outline,
                      onPressed: () {
                        ///Todo: Decline session request
                      },
                      isChipButton: true,
                      label: "Approve"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

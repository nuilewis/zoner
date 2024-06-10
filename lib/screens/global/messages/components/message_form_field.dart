import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';

class MessageFormField extends StatelessWidget {
  const MessageFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: ZonerInputDecoration.inputDecoration(context).copyWith(
              hintText: "Write a message",
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    icon: const Icon(
                      FluentIcons.attach_20_regular,
                    ),
                    onPressed: () {
                      // Handle photo action
                    },
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    icon: const Icon(
                      FluentIcons.camera_20_regular,
                    ),
                    onPressed: () {
                      // Handle photo action
                    },
                  ),
                  IconButton(
                    iconSize: 20,
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      FluentIcons.mic_20_regular,
                    ),
                    onPressed: () {
                      // Handle photo action
                    },
                  ),
                ],
              ),
              errorBorder: OutlineInputBorder(
                gapPadding: 4,
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.error, width: 1),
                borderRadius: BorderRadius.circular(kPadding48),
              ),
              border: OutlineInputBorder(
                gapPadding: 0,
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(kPadding48),
              ),
              enabledBorder: OutlineInputBorder(
                gapPadding: 0,
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(kPadding48),
              ),
              disabledBorder: OutlineInputBorder(
                gapPadding: 0,
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(kPadding48),
              ),
              focusedBorder: OutlineInputBorder(
                gapPadding: 0,
                //     borderSide: const BorderSide(width: 1, color: ZonerColors.purple70),
                borderRadius: BorderRadius.circular(kPadding48),
              ),
            ),
          ),
        ),
        const Gap(kPadding8),
        IconButton.filled(
          style: IconButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            fixedSize: const Size.square(48),
          ),
          icon: Icon(
            FluentIcons.send_24_filled,
            color: theme.scaffoldBackgroundColor,
          ),
          onPressed: () {
            // Handle send action
          },
        ),
      ],
    );
  }
}

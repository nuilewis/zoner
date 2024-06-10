import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';

class CallControls extends StatelessWidget {
  const CallControls({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kPadding32),
          color: Colors.white.withOpacity(.2)),
      padding: const EdgeInsets.all(kPadding16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Dave Davidson",
              style: theme.textTheme.titleLarge!.copyWith(color: Colors.white)),
          const Gap(kPadding8),
          Text("Patient",
              style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white)),
          const Gap(kPadding24),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton.filled(
                  style: IconButton.styleFrom(
                    fixedSize: const Size.square(48),
                    backgroundColor: Colors.white.withOpacity(.2),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    FluentIcons.speaker_2_24_regular,
                    color: Colors.white,
                  )),
              const Gap(kPadding12),
              IconButton.filled(
                  style: IconButton.styleFrom(
                    fixedSize: const Size.square(48),
                    backgroundColor: Colors.white.withOpacity(.2),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    FluentIcons.camera_24_regular,
                    color: Colors.white,
                  )),
              const Gap(kPadding12),
              IconButton.filled(
                  style: IconButton.styleFrom(
                    fixedSize: const Size.square(48),
                    backgroundColor: Colors.white.withOpacity(.2),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    FluentIcons.mic_24_regular,
                    color: Colors.white,
                  )),
              const Gap(kPadding12),
              IconButton.filled(
                  style: IconButton.styleFrom(
                    fixedSize: const Size.square(48),
                    backgroundColor: Colors.white.withOpacity(.2),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    FluentIcons.chat_24_regular,
                    color: Colors.white,
                  )),
              const Gap(kPadding12),
              IconButton.filled(
                style: IconButton.styleFrom(
                    fixedSize: const Size.square(48),
                    backgroundColor: ZonerColors.redSeed),
                onPressed: () {},
                icon: const Icon(
                  FluentIcons.call_24_filled,
                  color: Colors.white,
                ),
              ),
              const Gap(kPadding12),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import 'components/call_controls.dart';
import 'components/call_timer.dart';

class AudioCallScreen extends StatelessWidget {
  static const String id = "audio_call";
  const AudioCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding16),
        child: Column(
          children: [
            const Gap(kPadding64),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton.filled(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(.2),
                      elevation: 0,
                    ),
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      FluentIcons.chevron_left_24_filled,
                      color: Colors.white,
                    )),
                IconButton.filled(
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(.2)),
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      ///Todo: Trigger Side Bar
                    },
                    icon: const Icon(FluentIcons.list_rtl_20_filled,
                        color: Colors.white)),
              ],
            ),
            const Spacer(),
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/memoji.jpg"),
              radius: 64,
            ),
            const Gap(kPadding16),
            const CallTimer(),
            const Spacer(),
            const CallControls(),
            const Gap(kPadding64),
          ],
        ),
      ),
    );
  }
}

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:zoner/core/constants.dart';

import 'components/call_controls.dart';
import 'components/call_timer.dart';

class VideoCallScreen extends StatelessWidget {
  static const String id = "video_call_screen";
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
              const CallTimer(),
              IconButton.filled(
                  style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(.2)),
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(FluentIcons.list_rtl_20_filled,
                      color: Colors.white)),
            ],
          ),
          const Gap(kPadding16),
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                      color: ZonerColors.neutral20,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(kPadding32),
                          topLeft: Radius.circular(kPadding32))),
                ),
                Positioned(
                  bottom: 64,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                      ),
                      const FittedBox(child: CallControls()),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

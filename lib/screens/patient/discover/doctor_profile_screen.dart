import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:zoner/core/constants.dart';
import 'package:zoner/screens/components_global/components.dart';
import 'package:zoner/screens/global/messages/video_call_screen.dart';

import '../../doctor/profile/components/components.dart';
import '../../global/messages/audio_call_screen.dart';
import '../../global/messages/chat_screen.dart';

class DoctorProfileScreen extends StatelessWidget {
  static const String id = "doctor_profile";
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Might Reuse this stack widget
            ///----Header Section----///

            ProfileHeader(
              name: "Dr Lucy Lu",
              title: "Generalist",
              backgroundImage: const AssetImage("assets/images/memoji.jpg"),
              profileImage: const AssetImage("assets/images/memoji.jpg"),
              onMessagePressed: () {
                context.pushNamed(ChatScreen.id);
              },
              onAudioCallPressed: () {
                context.pushNamed(AudioCallScreen.id);
              },
              onVideoCallPressed: () {
                context.pushNamed(VideoCallScreen.id);
              },
            ),

            ///----Body Section-----///
            const Gap(kPadding24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kPadding16),
              child: Text(
                  "Gorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos."),
            ),
            const Gap(kPadding24),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Gap(kPadding16),
                  LargePillChips(
                    label: "8 Yrs",
                    icon: FluentIcons.clock_24_filled,
                  ),
                  Gap(kPadding12),
                  LargePillChips(
                    label: "4.9",
                    icon: FluentIcons.star_24_filled,
                  ),
                  Gap(kPadding12),
                  LargePillChips(
                    label: "37",
                    icon: FluentIcons.people_24_filled,
                  ),
                  Gap(kPadding12),
                  LargePillChips(
                    label: "Bamenda Regional Hospital",
                    iconPath: "assets/svg/hospital-filled.svg",
                  ),
                  Gap(kPadding16),
                ],
              ),
            ),
            const Gap(kPadding16),
            const AvailabilityCard(),
            const Gap(kPadding24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding16),
              child:
                  ZonerButton(onPressed: () {}, label: "Schedule Appointment"),
            ),
            const Gap(kPadding64),
          ],
        ),
      ),
    );
  }
}

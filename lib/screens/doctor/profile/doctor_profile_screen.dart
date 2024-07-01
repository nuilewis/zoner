import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:zoner/core/constants.dart';
import 'package:zoner/screens/shared/components_global/components.dart';

import '../../shared/messages/messages.dart';
import 'components/components.dart';

class DoctorProfileScreen extends StatelessWidget {
  static const String id = "doctor_profile";
  const DoctorProfileScreen({super.key, this.isPublicMode = false});

  final bool isPublicMode;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // final bool isDarkMode = theme.brightness == Brightness.dark;
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
              backgroundImage: const AssetImage("assets/images/image.jpg"),
              profileImage: const AssetImage("assets/images/memoji.jpg"),
              showActions: isPublicMode,
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const Gap(kPadding16),
                  LargePillChips(
                    label: "Bamenda Regional Hospital",
                    iconPath: "assets/svg/hospital-filled.svg",
                    color: theme.colorScheme.primary,
                  ),
                  const Gap(kPadding12),
                  LargePillChips(
                    label: "8 Yrs",
                    icon: FluentIcons.clock_24_filled,
                    color: theme.colorScheme.primary,
                  ),
                  const Gap(kPadding12),
                  LargePillChips(
                    label: "4.9",
                    icon: FluentIcons.star_24_filled,
                    color: theme.colorScheme.primary,
                  ),
                  const Gap(kPadding12),
                  LargePillChips(
                    label: "37",
                    icon: FluentIcons.people_24_filled,
                    color: theme.colorScheme.primary,
                  ),
                  const Gap(kPadding16),
                ],
              ),
            ),
            const Gap(kPadding16),
            const AvailabilityCard(),
            const Gap(kPadding24),

            const Gap(kPadding32),
            Visibility(
              visible: !isPublicMode,

              ///Doctor Statistic Section
              replacement: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding16),
                child: ZonerButton(
                    onPressed: () {}, label: "Schedule Appointment"),
              ),

              ///Patient Discovery Section
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding16),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Statistics",
                          style: theme.textTheme.titleLarge,
                        ),
                        const Gap(kPadding16),
                        const Row(
                          children: [
                            ZonerIcon(
                              icon: FluentIcons.people_24_regular,
                            ),
                            Gap(kPadding8),
                            Text(
                              "Consultations this week",
                            ),
                          ],
                        ),
                        const Gap(kPadding16),
                        Text(
                          "37",
                          style: theme.textTheme.displayMedium!.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    const Gap(kPadding16),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kPadding24),
                          color: theme.cardColor),
                      width: double.infinity,
                      height: 150,
                      child: const Center(
                        child: Text("Build graph here"),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Gap(kPadding64),
          ],
        ),
      ),
    );
  }
}

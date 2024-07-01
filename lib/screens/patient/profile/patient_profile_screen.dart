import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:zoner/core/core.dart';
import 'package:zoner/screens/shared/components_global/components.dart';

import '../../doctor/profile/components/components.dart';
import '../../shared/messages/messages.dart';
import 'components/components.dart';

class PatientProfileScreen extends StatelessWidget {
  static const String id = "patient_profile";
  const PatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // final bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///----Header Section----///

            ProfileHeader(
              name: "Dave Davidson",
              title: "Patient",
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
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Gap(kPadding16),
                  LargePillChips(
                    label: "158 cm",
                    icon: FluentIcons.person_24_filled,
                  ),
                  Gap(kPadding12),
                  LargePillChips(
                    label: "87kg",
                    icon: FluentIcons.scales_24_filled,
                  ),
                  Gap(kPadding12),
                  LargePillChips(
                    label: "23 yrs",
                    icon: FluentIcons.calendar_date_24_filled,
                  ),
                  Gap(kPadding16),
                ],
              ),
            ),
            const Gap(kPadding16),

            ///Medical Booklet Card
            const MedicalBookletCard(),

            const Gap(kPadding24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Allergies",
                    style: theme.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Gap(kPadding12),
                  const Wrap(
                    children: [
                      ZonerChip(
                        label: "Peanuts",
                        chipType: AppChipType.info,
                      ),
                      ZonerChip(
                        label: "Dogs",
                        chipType: AppChipType.info,
                      ),
                      ZonerChip(
                        label: "Cats",
                        chipType: AppChipType.info,
                      ),
                      ZonerChip(
                        label: "Wool",
                        chipType: AppChipType.info,
                      ),
                      ZonerChip(
                        label: "Peanuts",
                        chipType: AppChipType.info,
                      ),
                    ],
                  ),
                  const Gap(kPadding24),
                  Text(
                    "Medication",
                    style: theme.textTheme.titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Gap(kPadding12),
                  const Wrap(
                    children: [
                      ZonerChip(
                        label: "Peanuts",
                        chipType: AppChipType.info,
                      ),
                      ZonerChip(
                        label: "Dogs",
                        chipType: AppChipType.info,
                      ),
                      ZonerChip(
                        label: "Cats",
                        chipType: AppChipType.info,
                      ),
                      ZonerChip(
                        label: "Wool",
                        chipType: AppChipType.info,
                      ),
                      ZonerChip(
                        label: "Peanuts",
                        chipType: AppChipType.info,
                      ),
                    ],
                  ),
                  const Gap(kPadding32),
                  ZonerButton(
                      onPressed: () {}, label: "Start Session With Dave"),
                ],
              ),
            ),
            const Gap(kPadding64),
          ],
        ),
      ),
    );
  }
}

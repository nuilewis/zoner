import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:zoner/core/core.dart';
import 'package:zoner/screens/patient/profile/components/medical_book_item_card.dart';

import '../../doctor/profile/components/components.dart';
import '../../shared/messages/messages.dart';

class MedicationBookletScreen extends StatelessWidget {
  static const String id = "medication_booklet";
  const MedicationBookletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    //  final bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ///----Header Section----///

              ProfileHeader(
                name: "Dave Davidson",
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

              ///Medical Booklet Card
              Row(
                children: [
                  const Gap(kPadding16),
                  const Icon(
                    FluentIcons.book_24_filled,
                  ),
                  const Gap(kPadding8),
                  Text(
                    "Medical Booklet",
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
              const Gap(kPadding16),
              ListView.separated(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                separatorBuilder: (context, index) => const Gap(kPadding16),
                itemBuilder: (context, index) => MedicalBookletItemCard(
                    onPressed: () {}, onDownloadPressed: () {}),
              ),
              // CustomScrollView(
              //   //shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   slivers: [
              //     SliverPrototypeExtentList.builder(
              //         itemBuilder: (context, index) => MedicalBookletItemCard(
              //             onPressed: () {}, onDownloadPressed: () {}),
              //         prototypeItem: MedicalBookletItemCard(
              //             onPressed: () {}, onDownloadPressed: () {}),
              //         itemCount: 7),
              //   ],
              // ),
              const Gap(kPadding64),
            ],
          ),
        ),
      ),
    );
  }
}

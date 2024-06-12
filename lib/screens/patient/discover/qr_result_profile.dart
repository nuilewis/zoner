import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/screens/components_global/components.dart';

import '../../../core/constants.dart';
import '../../doctor/profile/components/components.dart';

class QrResultProfile extends StatelessWidget {
  static const String id = "qr_result";
  const QrResultProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(kPadding24),
              topRight: Radius.circular(kPadding24))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(kPadding8),
          Container(
            height: 8,
            width: 42,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kPadding8),
                color: theme.cardColor),
          ),
          const Gap(kPadding32),
          const CircleAvatar(
            radius: 64,
            backgroundImage: AssetImage("assets/images/memoji.jpg"),
          ),
          const Gap(kPadding16),
          Text(
            "Dr Lucy Lu",
            style: theme.textTheme.bodyLarge!.copyWith(fontFamily: "Gloock"),
          ),
          const Gap(kPadding4),
          Text(
            "Oncologist",
            style: theme.textTheme.bodyMedium!
                .copyWith(color: ZonerColors.neutral50),
          ),
          const Gap(kPadding24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kPadding16),
            child: Text(
                "Gorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos."),
          ),
          const Gap(kPadding16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const Gap(kPadding16),
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
                const Gap(kPadding12),
                LargePillChips(
                  label: "Bamenda Regional Hospital",
                  iconPath: "assets/svg/hospital-filled.svg",
                  color: theme.colorScheme.primary,
                ),
                const Gap(kPadding16),
              ],
            ),
          ),
          const Gap(kPadding24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding16),
            child: ZonerButton(
              onPressed: () {},
              label: "View Profile",
              icon: FluentIcons.person_24_regular,
            ),
          ),
          const Gap(kPadding64),
        ],
      ),
    );
  }
}

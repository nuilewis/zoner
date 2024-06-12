import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:zoner/core/core.dart';
import 'package:zoner/screens/components_global/components.dart';
import 'package:zoner/screens/patient/discover/hospital_details_screen.dart';

import 'components/facility_card.dart';

class DiscoverScreen extends StatelessWidget {
  static const String id = "discover";
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kPadding16),
              child: ZonerAppBar(pageTitle: "Discover"),
            ),
            Row(
              children: [
                const Expanded(child: ZonerSearchBar()),
                const Gap(kPadding16),
                IconButton.filled(
                    style: IconButton.styleFrom(
                      backgroundColor: isDarkMode
                          ? ZonerColors.neutral20
                          : ZonerColors.neutral95,
                      fixedSize: const Size.square(48),
                      splashFactory: InkSparkle.splashFactory,
                    ),
                    onPressed: () {
                      ///Todo: Change to Map
                    },
                    icon: const Icon(FluentIcons.map_24_regular))
              ],
            ),
            const Gap(kPadding8),
            Row(
              children: [
                IconButton.filled(
                    style: IconButton.styleFrom(
                      backgroundColor: isDarkMode
                          ? ZonerColors.neutral20
                          : ZonerColors.neutral95,
                      fixedSize: const Size.square(34),
                      splashFactory: InkSparkle.splashFactory,
                    ),
                    onPressed: () {
                      ///Todo: Change to Map
                    },
                    icon: const Icon(FluentIcons.filter_24_regular)),
                const Gap(kPadding8),
                Wrap(
                  spacing: 8,
                  children: [
                    ZonerChip(
                        icon: FluentIcons.crop_sparkle_24_filled,
                        chipType: AppChipType.filter,
                        onSelected: (selected) {
                          ///Todo: Dismiss Chip
                        },
                        label: "Hospital"),
                    ZonerChip(
                        icon: FluentIcons.content_settings_20_regular,
                        chipType: AppChipType.info,
                        onSelected: (selected) {
                          ///Todo: Dismiss Chip
                        },
                        label: "Hospital"),
                  ],
                )
              ],
            ),
            const Gap(kPadding24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding16),
              child: Row(
                children: [
                  Text("Hospitals near you", style: theme.textTheme.titleLarge),
                  const Spacer(),
                  ZonerButton(
                      buttonType: AppButtonType.text,
                      onPressed: () {},
                      label: "View all"),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: kPadding16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => FacilityCard(
                      onPressed: () {
                        context.pushNamed(HospitalDetailsScreen.id);
                      },
                      label: "Bamenda Regional Hospital",
                      imagePath: "assets/images/image.jpg"),
                  separatorBuilder: (context, index) => const Gap(kPadding16),
                  itemCount: 4),
            ),
            const Gap(kPadding24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding16),
              child: Row(
                children: [
                  Text("Pharmacies", style: theme.textTheme.titleLarge),
                  const Spacer(),
                  ZonerButton(
                      buttonType: AppButtonType.text,
                      onPressed: () {},
                      label: "View all"),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: kPadding16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => FacilityCard(
                      onPressed: () {
                        context.pushNamed(HospitalDetailsScreen.id);
                      },
                      label: "Zoner Pharmacy",
                      imagePath: "assets/images/image.jpg"),
                  separatorBuilder: (context, index) => const Gap(kPadding16),
                  itemCount: 4),
            ),
            const Gap(kPadding24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding16),
              child: Row(
                children: [
                  Text("Laboratories", style: theme.textTheme.titleLarge),
                  const Spacer(),
                  ZonerButton(
                      buttonType: AppButtonType.text,
                      onPressed: () {},
                      label: "View all"),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: kPadding16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => FacilityCard(
                      onPressed: () {
                        context.pushNamed(HospitalDetailsScreen.id);
                      },
                      label: "Zoner Labs",
                      imagePath: "assets/images/image.jpg"),
                  separatorBuilder: (context, index) => const Gap(kPadding16),
                  itemCount: 4),
            ),
            const Gap(kPadding64),
          ],
        ),
      ),
    );
  }
}

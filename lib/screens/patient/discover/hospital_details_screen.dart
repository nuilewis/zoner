import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/core/core.dart';
import 'package:zoner/screens/components_global/large_pill_chips.dart';
import 'package:zoner/screens/doctor/profile/components/availibility_list_item.dart';

import '../../components_global/components.dart';

final List<String> facilities = [
  "Imaging",
  "Laboratory",
  "Emergency",
  "Oncology",
  "Operating Rooms",
];

class HospitalDetailsScreen extends StatelessWidget {
  static const String id = "hospital_details";
  const HospitalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kPadding16),
              child: ZonerAppBar(pageTitle: 'Bamenda Regional Hospital'),
            ),
            // Hospital Image and Info
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: kPadding16),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/image.jpg")),
                  borderRadius: BorderRadius.circular(kPadding24),
                ),
              ),
            ),
            const Gap(kPadding16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ZonerChip(
                  label: 'Open',
                  chipType: AppChipType.info,
                  selectedBackgroundColor: ZonerColors.green95,
                  selectedColor: ZonerColors.green30,
                ),
                const Gap(kPadding12),
                ZonerChip(
                  label: 'Hospital',
                  chipType: AppChipType.info,
                  iconPath: "assets/svg/hospital-filled.svg",
                  selectedBackgroundColor: theme.cardColor,
                  selectedColor: theme.colorScheme.primary,
                ),
                const Gap(kPadding12),
                ZonerChip(
                  label: '4.5',
                  icon: FluentIcons.star_24_filled,
                  chipType: AppChipType.info,
                  selectedBackgroundColor: theme.colorScheme.secondaryContainer,
                  selectedColor: theme.colorScheme.secondary,
                ),
              ],
            ),
            const Gap(kPadding16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kPadding16),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const Gap(kPadding16),

            // Opening Hours
            Container(
              margin: const EdgeInsets.symmetric(horizontal: kPadding16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  //   color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(kPadding24),
                  border: Border.all(
                      width: 1,
                      color: isDarkMode
                          ? ZonerColors.neutral20
                          : ZonerColors.neutral90)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ZonerIcon(
                        icon: FluentIcons.clock_24_regular,
                        color: theme.colorScheme.primary,
                      ),
                      const Gap(kPadding8),
                      Text('Opening Hours',
                          style: theme.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w800,
                              color: theme.colorScheme.primary))
                    ],
                  ),
                  const Gap(kPadding16),
                  const AvailabilityTimeListItem(
                      day: "Monday", availability: "7:00 am - 9:00pm"),
                  const AvailabilityTimeListItem(
                      day: "Tuesday", availability: "7:00 am - 9:00pm"),
                  const AvailabilityTimeListItem(
                      day: "Wednesday", availability: "7:00 am - 9:00pm"),
                  const AvailabilityTimeListItem(
                      day: "Thursday", availability: "7:00 am - 9:00pm"),
                ],
              ),
            ),
            const Gap(kPadding24),

            // Gallery
            Padding(
              padding: const EdgeInsets.only(left: kPadding16),
              child: Text('Gallery', style: theme.textTheme.titleLarge),
            ),
            const Gap(kPadding16),
            SizedBox(
              height: 180,
              child: CustomScrollView(
                scrollDirection: Axis.horizontal,
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: kPadding16),
                    sliver: SliverList.separated(
                        itemCount: 5,
                        itemBuilder: (context, index) => ClipRRect(
                              borderRadius: BorderRadius.circular(kPadding16),
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Image.asset(
                                  "assets/images/image.jpg", //
                                  // Replace with actual image URL

                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) =>
                            const Gap(kPadding16)),
                  )
                ],
              ),
            ),

            const Gap(kPadding24),

            // Facilities
            Padding(
              padding: const EdgeInsets.only(left: kPadding16),
              child: Row(
                children: [
                  Text(
                    'Facilities',
                    style: theme.textTheme.titleLarge,
                  ),
                  const Spacer(),
                  ZonerButton(
                      buttonType: AppButtonType.text,
                      onPressed: () {},
                      label: "View all")
                ],
              ),
            ),
            const Gap(kPadding8),
            SizedBox(
              height: 70,
              child: CustomScrollView(
                scrollDirection: Axis.horizontal,
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: kPadding16),
                    sliver: SliverList.separated(
                        itemCount: facilities.length,
                        itemBuilder: (context, index) => FittedBox(
                              fit: BoxFit.contain,
                              child: LargePillChips(
                                label: facilities[index],
                                color: theme.colorScheme.primary,
                              ),
                            ),
                        separatorBuilder: (context, index) =>
                            const Gap(kPadding16)),
                  ),
                ],
              ),
            ),

            const Gap(kPadding24),

            // Map

            AspectRatio(
              aspectRatio: 16 / 7,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: kPadding16),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(kPadding24),
                ),
                child: Stack(
                  children: [
                    //Map Here
                    Positioned(
                      top: kPadding8,
                      right: kPadding8,
                      child: Row(
                        children: [
                          IconButton.filled(
                              onPressed: () {},
                              style: IconButton.styleFrom(
                                  fixedSize: const Size.square(42),
                                  backgroundColor:
                                      theme.scaffoldBackgroundColor),
                              icon: ZonerIcon(
                                color: theme.colorScheme.primary,
                                icon: FluentIcons.arrow_maximize_24_regular,
                              )),
                          const Gap(kPadding8),
                          IconButton.filled(
                              onPressed: () {},
                              style: IconButton.styleFrom(
                                  fixedSize: const Size.square(42),
                                  backgroundColor:
                                      theme.scaffoldBackgroundColor),
                              icon: ZonerIcon(
                                color: theme.colorScheme.primary,
                                icon: FluentIcons.location_arrow_24_regular,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(kPadding64)
          ],
        ),
      ),
    );
  }
}

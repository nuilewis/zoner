import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/core/core.dart';
import 'package:zoner/screens/patient/discover/components/available_time_selector.dart';
import 'package:zoner/screens/shared/components_global/components.dart';

class ScheduleAppointmentScreen extends StatelessWidget {
  static const String id = "schedule_appointment";
  const ScheduleAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          const ZonerAppBar(pageTitle: "Schedule Consultation"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding16),
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                      height: 112,
                      width: 112,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: theme.scaffoldBackgroundColor, width: 6),
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              image: AssetImage("assets/images/memoji.jpg")))),
                  Text("Dr Lucy Lu",
                      style: theme.textTheme.titleLarge!
                          .copyWith(color: theme.colorScheme.primary)),
                  const Gap(kPadding8),
                  Text("Generalist",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: ZonerColors.neutral50)),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(kPadding16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kPadding24),
                      color: theme.cardColor,
                      //   border: Border.all(color: ZonerColors.neutral90)
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              FluentIcons.calendar_24_filled,
                              color: theme.colorScheme.primary,
                            ),
                            const Gap(kPadding8),
                            Text(
                              "Today's Availability",
                              style: theme.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w800,
                                // color: theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        const Gap(kPadding16),
                        AvailabilityTimeSelector(selectedTime: (selectedTime) {
                          ///Todo: Do something with the selected time
                        })
                      ],
                    ),
                  ),
                  const Spacer(),
                  ZonerButton(
                      buttonType: AppButtonType.outline,
                      onPressed: () {},
                      icon: FluentIcons.calendar_24_filled,
                      label: "Pick another day"),
                  const Gap(kPadding12),
                  ZonerButton(
                    onPressed: () {},
                    label: "Book Appointment",
                    icon: FluentIcons.person_24_filled,
                    color: theme.scaffoldBackgroundColor,
                  ),
                  const Gap(kPadding64),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

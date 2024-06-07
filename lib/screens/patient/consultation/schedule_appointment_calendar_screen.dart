import 'package:calendar_view/calendar_view.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/core/core.dart';
import 'package:zoner/screens/components_global/components.dart';
import 'package:zoner/screens/patient/consultation/components/calendar_day_selector.dart';

class ScheduleAppointmentCalendarScreen extends StatefulWidget {
  static const String id = "schedule_appointment_calendar";
  const ScheduleAppointmentCalendarScreen({super.key});

  @override
  State<ScheduleAppointmentCalendarScreen> createState() =>
      _ScheduleAppointmentCalendarScreenState();
}

class _ScheduleAppointmentCalendarScreenState
    extends State<ScheduleAppointmentCalendarScreen> {
  String _selectedDay = "Sunday";

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ZonerAppBar(pageTitle: "Schedule Consultation"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                          height: 48,
                          width: 48,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/memoji.jpg")))),
                      const Gap(kPadding12),
                      Text("Dr Lucy Lu's Calendar",
                          style: theme.textTheme.bodyMedium),
                    ],
                  ),
                  const Gap(kPadding16),

                  ///Month Selector
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kPadding16, vertical: kPadding8),
                    decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(kPadding32)),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("October"),
                        Gap(kPadding8),
                        Icon(FluentIcons.chevron_down_24_regular)
                      ],
                    ),
                  ),
                  const Gap(kPadding16),
                  Row(
                    children: [
                      const Text("This Week"),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon:
                              const Icon(FluentIcons.chevron_left_24_regular)),
                      const Gap(kPadding8),
                      IconButton(
                          onPressed: () {},
                          icon:
                              const Icon(FluentIcons.chevron_right_24_regular)),
                    ],
                  ),
                  const Gap(kPadding8),
                  CalendarWeekDaySelector(selectedDay: (selectedDay) {
                    //  print(selectedDay);

                    setState(() {
                      _selectedDay = selectedDay;
                    });
                  }),
                  const Gap(kPadding16),
                  Text(
                    "$_selectedDay, Oct 03, 2024",
                    style: theme.textTheme.headlineSmall!.copyWith(
                        color: theme.colorScheme.primary,
                        fontFamily: "Plus Jakarta Sans"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .7,
              child: DayView(
                scrollPhysics: const NeverScrollableScrollPhysics(),
                backgroundColor: theme.scaffoldBackgroundColor,
                dayTitleBuilder: (DateTime now) {
                  return const SizedBox.shrink();
                },
                verticalLineOffset: 0,
                timeLineOffset: 5,
                minuteSlotSize: MinuteSlotSize.minutes30,
                liveTimeIndicatorSettings:
                    LiveTimeIndicatorSettings(color: theme.colorScheme.primary),
                startHour: 3,
                hourIndicatorSettings: const HourIndicatorSettings(
                    color: ZonerColors.purple90, offset: 4),
                heightPerMinute: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

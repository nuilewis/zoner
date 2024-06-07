import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:zoner/screens/patient/consultation/components/calendar_day_selector_item.dart';

class CalendarWeekDaySelector extends StatefulWidget {
  const CalendarWeekDaySelector({super.key, required this.selectedDay});
  final void Function(String selectedDay) selectedDay;

  @override
  State<CalendarWeekDaySelector> createState() =>
      _CalendarWeekDaySelectorState();
}

class _CalendarWeekDaySelectorState extends State<CalendarWeekDaySelector> {
  final List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  final List<String> date = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
  ];

  Map<int, bool> isDaySelected = {};

  @override
  Widget build(BuildContext context) {
    //Gets the separator spacing by calculating the the width of the device and
    //subtracting the combined widths of the daySelectorItems+padding,
    //then dividing the remaining space by 6 (6 spaces in between 7 objects)
    double separatorSpacing =
        (MediaQuery.sizeOf(context).width - 32 - (44 * 7)) / 6;
    return SizedBox(
      height: 64,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            isDaySelected.putIfAbsent(index, () => false);
            return Center(
              child: CalendarDaySelectorItem(
                dayLabel: days[index].substring(0, 1).toUpperCase(),
                date: date[index],
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  Feedback.forTap(context);
                  isDaySelected.updateAll((key, value) => false);
                  isDaySelected.update(
                      index, (value) => !isDaySelected[index]!);

                  setState(() {});
                  widget.selectedDay.call(days[index]);
                },
                isSelected: isDaySelected[index]!,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Gap(separatorSpacing);
          },
          itemCount: days.length),
    );
  }
}

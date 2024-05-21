import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoner/core/constants.dart';

import 'availability_time_item.dart';

class AvailabilityTimeSelector extends StatefulWidget {
  ///Todo: refactor this function to return DateTime objects
  final Function(String time) selectedTime;
  const AvailabilityTimeSelector({super.key, required this.selectedTime});

  @override
  State<AvailabilityTimeSelector> createState() =>
      _AvailabilityTimeSelectorState();
}

class _AvailabilityTimeSelectorState extends State<AvailabilityTimeSelector> {
  Map<int, bool> isTimeSelected = {};
  List<String> availableTimes = [
    "9:00 am",
    "10:00 am",
    "11:00 am",
    "12:00 pm",
    "1:00 pm",
    "2:00 pm",
    "3:00 pm",
    "4:00 pm",
    "5:00 pm",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: availableTimes.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: kPadding8,
          crossAxisSpacing: kPadding8,
          crossAxisCount: 3,
          childAspectRatio: 2.5),
      itemBuilder: (context, index) {
        ///Deselect All and select this
        isTimeSelected.putIfAbsent(index, () => false);

        return AvailabilityTimeItem(
          onPressed: () {
            HapticFeedback.mediumImpact();
            Feedback.forTap(context);
            isTimeSelected.updateAll((key, value) => false);
            isTimeSelected.update(index, (value) => !isTimeSelected[index]!);

            ///Calls a selectedTime function, to expose the SelectedTime in the parent widget
            setState(() {});
            widget.selectedTime.call(availableTimes[index]);
          },
          time: availableTimes[index],
          isSelected: isTimeSelected[index]!,
        );
      },
    );
  }
}

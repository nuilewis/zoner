import 'package:flutter/material.dart';
import 'package:zoner/core/constants.dart';

class AvailabilityTimeItem extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isSelected;
  final DateTime? dateTime;
  final Color? backgroundColor;
  final Color? color;
  final String time;
  const AvailabilityTimeItem(
      {super.key,
      required this.time,
      this.dateTime,
      this.backgroundColor,
      this.color,
      required this.onPressed,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(kPadding32),
      splashFactory: InkSparkle.splashFactory,
      splashColor: theme.colorScheme.primary.withOpacity(.2),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: kPadding16, vertical: kPadding8),
        decoration: BoxDecoration(
            color: isSelected ? theme.colorScheme.primary : null,
            borderRadius: BorderRadius.circular(kPadding32),
            border: Border.all(
                color:
                    isDarkMode ? ZonerColors.neutral20 : ZonerColors.purple80)),
        child: Center(
          child: Text(
            time,
            style: theme.textTheme.bodyMedium!.copyWith(
                color: isSelected
                    ? theme.scaffoldBackgroundColor
                    : ZonerColors.neutral50),
          ),
        ),
      ),
    );
  }
}

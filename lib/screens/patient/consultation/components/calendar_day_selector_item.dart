import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/core/constants.dart';

class CalendarDaySelectorItem extends StatefulWidget {
  const CalendarDaySelectorItem({
    super.key,
    this.color,
    this.backgroundColor,
    required this.dayLabel,
    required this.date,
    required this.onPressed,
    this.isSelected = false,
  });
  final String dayLabel;
  final String date;
  final bool isSelected;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? color;

  @override
  State<CalendarDaySelectorItem> createState() =>
      _CalendarDaySelectorItemState();
}

class _CalendarDaySelectorItemState extends State<CalendarDaySelectorItem>
    with TickerProviderStateMixin {
  final Color _color = ZonerColors.purpleSeed;


  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    return InkWell(
      onTap: widget.onPressed,
      splashColor: _color.withOpacity(.2),
      splashFactory: InkSparkle.splashFactory,
      borderRadius: BorderRadius.circular(kPadding32),
      child: Ink(
        height: 64,
        width: 44,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(kPadding32),
          color:
              widget.isSelected ? theme.colorScheme.primary : theme.cardColor,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.dayLabel,
                  style: theme.textTheme.bodyMedium!.copyWith(
                      color: widget.isSelected
                          ? (isDarkMode
                              ? ZonerColors.purple10
                              : ZonerColors.white)
                          : (isDarkMode
                              ? ZonerColors.white
                              : ZonerColors.neutral50),
                      fontWeight: widget.isSelected
                          ? FontWeight.w800
                          : FontWeight.normal)),
              const Gap(kPadding8),
              Text(widget.date,
                  style: theme.textTheme.bodyMedium!.copyWith(
                      color: widget.isSelected
                          ? (isDarkMode
                              ? ZonerColors.purple10
                              : ZonerColors.white)
                          : (isDarkMode
                              ? ZonerColors.white
                              : ZonerColors.neutral50),
                      fontWeight: widget.isSelected
                          ? FontWeight.w800
                          : FontWeight.normal)),
            ],
          ),
        ),
      ),
    );
  }
}

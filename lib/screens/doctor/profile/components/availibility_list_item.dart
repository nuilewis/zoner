import 'package:flutter/material.dart';

class AvailabilityListItem extends StatelessWidget {
  final String day;
  final String availability;
  const AvailabilityListItem(
      {super.key, required this.day, required this.availability});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Text(day),
        const Spacer(),
        Text(
          availability,
          style: theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w800,
            //  color: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

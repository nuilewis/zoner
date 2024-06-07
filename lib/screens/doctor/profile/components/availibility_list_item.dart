import 'package:flutter/material.dart';
import 'package:zoner/core/constants.dart';

class AvailabilityTimeListItem extends StatelessWidget {
  final String day;
  final String availability;
  const AvailabilityTimeListItem(
      {super.key, required this.day, required this.availability});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kPadding4),
      child: Row(
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
      ),
    );
  }
}

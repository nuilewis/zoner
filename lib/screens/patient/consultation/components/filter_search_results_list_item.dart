import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';

class FilterSearchResultListItem extends StatelessWidget {
  final String label;
  final IconData icon;
  const FilterSearchResultListItem(
      {super.key, required this.label, required this.icon});

  ///Todo: Evolve this widget to cover all use cases
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kPadding4),
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.all(kPadding8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.cardColor,
              ),
              child: Icon(
                icon,
                color: theme.colorScheme.primary,
                size: 16,
              )),
          const Gap(kPadding8),
          Text(label),
        ],
      ),
    );
  }
}

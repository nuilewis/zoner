import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';

class CallTimer extends StatelessWidget {
  const CallTimer({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: kPadding16, vertical: kPadding8),
      decoration: BoxDecoration(

          ///Might make this glassmorphism
          borderRadius: BorderRadius.circular(kPadding24),
          color: Colors.white.withOpacity(.2)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ZonerColors.greenSeed,
            ),
          ),
          const Gap(kPadding8),
          Text(
            "16:35",
            style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}

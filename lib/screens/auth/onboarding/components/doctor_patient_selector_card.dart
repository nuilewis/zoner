import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';

class DoctorPatientSelectorCard extends StatelessWidget {
  final bool isSelected;
  final UserType userType;
  final VoidCallback onPressed;
  const DoctorPatientSelectorCard(
      {super.key,
      required this.isSelected,
      required this.onPressed,
      required this.userType});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16),
        splashFactory: InkSparkle.splashFactory,
        splashColor: theme.colorScheme.primary.withOpacity(.2),
        child: Ink(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: ZonerColors.neutral90),
            borderRadius: BorderRadius.circular(24),
            color: isSelected ? theme.colorScheme.primary : null,
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 42,
                backgroundImage: AssetImage("assets/images/memoji.png"),
              ),
              const Gap(kPadding16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userType == UserType.doctor ? "Doctor" : "Patient",
                      style: theme.textTheme.titleLarge!
                          .copyWith(color: isSelected ? Colors.white : null),
                    ),
                    const Gap(kPadding8),
                    Text(
                      userType == UserType.doctor
                          ? "Consult patients, prescribe medications, earn"
                          : "Consult with Doctors, order medications, and lab tests, find hospitals and so much more",
                      style: theme.textTheme.bodyMedium!.copyWith(
                          color: isSelected
                              ? Colors.white
                              : ZonerColors.neutral50),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

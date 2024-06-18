import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

import '/../../../core/core.dart';
import 'components/doctor_patient_selector.dart';

class DoctorPatientSelectorScreen extends StatelessWidget {
  static const String id = "doctor_patient_select";
  const DoctorPatientSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //  ZonerAppBar(pageTitle: "I am a;"),
            const Spacer(),
            Text(
              "Are you a doctor or patient?",
              style: theme.textTheme.displaySmall!.copyWith(height: 1.2),
              textAlign: TextAlign.center,
            )
                .animate()
                .moveY(
                    duration: 600.ms,
                    begin: 50,
                    end: 0,
                    delay: 100.ms,
                    curve: Curves.easeOut)
                .fadeIn(
                  duration: 1200.ms,
                ),
            const Gap(kPadding64),
            DoctorPatientSelector(
                selectedUserType: (UserType selectedUserType) {
              ///Todo: Do something with the selected card;
            }),
            const Gap(32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton.filled(
                  style: IconButton.styleFrom(
                      elevation: 0, fixedSize: const Size.square(64)),
                  onPressed: () {},
                  icon: const Icon(
                    FluentIcons.arrow_right_24_regular,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Gap(kPadding64),
          ],
        ),
      ),
    );
  }
}

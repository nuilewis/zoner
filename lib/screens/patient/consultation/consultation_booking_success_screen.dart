import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/core/core.dart';

import '../../shared/components_global/components.dart';
import 'components/components.dart';

class ConsultationBookingSuccessScreen extends StatelessWidget {
  static const String id = "consultation_booking_success";
  const ConsultationBookingSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding16),
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),

            ///Todo: Add Appbar with back button
            const Icon(
              FluentIcons.checkmark_circle_48_regular,
              size: 72,
              color: ZonerColors.green70,
            ),
            const Gap(kPadding16),
            Text("Success",
                style: theme.textTheme.titleLarge!
                    .copyWith(color: theme.colorScheme.primary)),
            const Gap(kPadding16),
            Text(
                "Consultation appointment has been created and added to your calendar successfully",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium!
                    .copyWith(color: ZonerColors.neutral50)),
            const Gap(kPadding64),
            const PurchaseDetailsLstItem(
              label: "Dr Lucy Lu",
              content: "Generalist",
              icon: FluentIcons.person_24_regular,
            ),
            const Gap(kPadding12),
            const PurchaseDetailsLstItem(
              label: "Amount",
              content: "2500 RWF",
              icon: FluentIcons.wallet_credit_card_24_regular,
            ),
            const Gap(kPadding12),
            const PurchaseDetailsLstItem(
              label: "Date",
              content: "May 03, 2024",
              icon: FluentIcons.calendar_24_regular,
            ),
            const Gap(kPadding12),
            const PurchaseDetailsLstItem(
              label: "Time",
              content: "9:00 am - 10:00 am",
              icon: FluentIcons.clock_24_regular,
            ),
            const Spacer(
              flex: 1,
            ),
            ZonerButton(
              onPressed: () {},
              label: "Awesome",
              // icon: FluentIcons.person_24_filled,
              color: theme.scaffoldBackgroundColor,
            ),
            const Gap(kPadding64),
          ],
        ),
      ),
    );
  }
}

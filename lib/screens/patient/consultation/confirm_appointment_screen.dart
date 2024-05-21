import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/core/core.dart';
import 'package:zoner/screens/components_global/components.dart';

import 'components/components.dart';

class ConfirmAppointmentScreen extends StatelessWidget {
  static const String id = "confirm_appointment";
  const ConfirmAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          const ZonerAppBar(pageTitle: "Confirm Appointment"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kPadding16),
              child: Column(
                children: [
                  Text(
                    "You have chosen an appointment with",
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: ZonerColors.neutral50),
                  ),
                  const Gap(kPadding8),
                  Container(
                      height: 112,
                      width: 112,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: theme.scaffoldBackgroundColor, width: 6),
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              image: AssetImage("assets/images/memoji.jpg")))),
                  Text("Dr Lucy Lu",
                      style: theme.textTheme.titleLarge!
                          .copyWith(color: theme.colorScheme.primary)),
                  const Gap(kPadding4),
                  Text("Generalist",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: ZonerColors.neutral50)),
                  const Gap(kPadding16),
                  const PurchaseDetailsLstItem(
                    label: "Amount",
                    content: "2500 RWF",
                    icon: FluentIcons.wallet_credit_card_24_regular,
                  ),
                  const Gap(kPadding12),
                  const PurchaseDetailsLstItem(
                    label: "Date",
                    content: "2500 RWF",
                    icon: FluentIcons.calendar_24_regular,
                  ),
                  const Gap(kPadding12),
                  const PurchaseDetailsLstItem(
                    label: "Time",
                    content: "9:00 am - 10:00 am",
                    icon: FluentIcons.clock_24_regular,
                  ),
                  const Gap(kPadding16),
                  TextFormField(
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    decoration:
                        ZonerInputDecoration.inputDecoration(context).copyWith(
                      hintText: "Anything you would like the doctor to know?",
                    ),
                  ),
                  const Spacer(),
                  ZonerButton(
                      buttonType: AppButtonType.outline,
                      onPressed: () {},
                      // icon: FluentIcons.dismiss_24_regular,
                      label: "Cancel"),
                  const Gap(kPadding12),
                  ZonerButton(
                    onPressed: () {},
                    label: "Pay & Book Appointment",
                    // icon: FluentIcons.person_24_filled,
                    color: theme.scaffoldBackgroundColor,
                  ),
                  const Gap(kPadding64),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

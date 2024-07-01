import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:zoner/core/constants.dart';
import 'package:zoner/screens/patient/consultation/components/components.dart';

import '../../shared/components_global/components.dart';

class CheckoutSuccessScreen extends StatelessWidget {
  static const String id = "checkout_success";
  const CheckoutSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    // final bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding16),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    color: theme.cardColor, shape: BoxShape.circle),
              ),
              const Gap(kPadding16),
              Text('Success 🎊',
                  style: theme.textTheme.headlineMedium!
                      .copyWith(color: theme.colorScheme.primary),
                  textAlign: TextAlign.center),
              const Gap(kPadding16),
              Text('Successful Payment of',
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: ZonerColors.neutral50),
                  textAlign: TextAlign.center),
              const Gap(kPadding16),
              Align(
                alignment: Alignment.center,
                child: Text('8500 RWF',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium!.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Plus Jakarta Sans")),
              ),
              const Gap(kPadding8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ZonerIcon(
                    icon: FluentIcons.calendar_24_regular,
                    color: ZonerColors.neutral50,
                  ),
                  const Gap(kPadding8),
                  Text(
                    'Today, 10:00 AM',
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: ZonerColors.neutral50),
                  )
                ],
              ),
              const Gap(kPadding16),
              Text(
                'Here is your receipt',
                style: theme.textTheme.bodyMedium!
                    .copyWith(color: ZonerColors.neutral50),
              ),
              const Gap(kPadding32),
              const PurchaseDetailsLstItem(
                label: "Dr Lucy LU",
                content: "2500 RWF",
                icon: FluentIcons.person_24_regular,
              ),
              const PurchaseDetailsLstItem(
                label: "Malaria Test",
                content: "2500 RWF",
                icon: FluentIcons.beaker_24_regular,
              ),
              const PurchaseDetailsLstItem(
                label: "Alluprinol",
                content: "2500 RWF",
                icon: FluentIcons.beaker_24_regular,
              ),
              const PurchaseDetailsLstItem(
                label: "Erythromycin",
                content: "2500 RWF",
                icon: FluentIcons.pill_20_regular,
              ),
              const PurchaseDetailsLstItem(
                label: "Erythromycin",
                content: "2500 RWF",
                icon: FluentIcons.pill_20_regular,
              ),
              const Spacer(),
              ZonerButton(
                  onPressed: () {
                    context.goNamed(BottomNavBar.id);
                  },
                  label: "Go Home"),
              const Gap(kPadding64),
            ],
          ),
        ),
      ),
    );
  }
}

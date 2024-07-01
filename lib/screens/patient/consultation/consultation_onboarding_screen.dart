import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/core.dart';
import '../../shared/components_global/components.dart';

class ConsultationOnboardingScreen extends StatelessWidget {
  static const String id = "consultation_onboarding";
  const ConsultationOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ZonerAppBar(
            pageTitle: "Consult with Doctor",
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(FluentIcons.cart_24_regular),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(FluentIcons.list_rtl_20_regular),
              )
            ],
          ),
          const Spacer(),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: theme.cardColor,
              shape: BoxShape.circle,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ZonerButton(onPressed: () {}, label: "Begin Consultation"),
          ),
          const Gap(kPadding64),
        ],
      ),
    );
  }
}

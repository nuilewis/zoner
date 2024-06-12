import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';
import '../../consultation/components/components.dart';

class SessionCartItem extends StatelessWidget {
  const SessionCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(kPadding16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kPadding24),
          border: Border.all(
            width: 1,
            color: isDarkMode ? ZonerColors.neutral20 : ZonerColors.neutral90,
          )),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/memoji.jpg"),
                radius: 38,
              ),
              Gap(kPadding16),
              Expanded(child: Text("Session with Dr Lucy")),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    FluentIcons.delete_24_regular,
                    color: theme.colorScheme.error,
                  )),
            ],
          ),
          Gap(kPadding16),
          PurchaseDetailsLstItem(
              icon: FluentIcons.calendar_24_regular,
              label: "Date",
              content: "Oct 03. 2024"),
          PurchaseDetailsLstItem(
              icon: FluentIcons.clock_24_regular,
              label: "Time",
              content: "9:10 am"),
          PurchaseDetailsLstItem(
              icon: FluentIcons.wallet_24_regular,
              label: "Amount",
              content: "2500 RWF"),
        ],
      ),
    );
  }
}

class MedicationCartItem extends StatelessWidget {
  const MedicationCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(kPadding16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kPadding24),
          border: Border.all(
            width: 1,
            color: isDarkMode ? ZonerColors.neutral20 : ZonerColors.neutral90,
          )),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kPadding16),
                child: Image.asset(
                  "assets/images/memoji.jpg",
                  fit: BoxFit.fill,
                ),
              )),
          Gap(kPadding16),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Erythromycin",
                          style: theme.textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "500mg",
                          style: theme.textTheme.bodyMedium!
                              .copyWith(color: theme.colorScheme.primary),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FluentIcons.delete_24_regular,
                          color: theme.colorScheme.error,
                        )),
                  ],
                ),
                Gap(kPadding16),
                Row(
                  children: [
                    IconButton.filled(
                        style: IconButton.styleFrom(
                          backgroundColor: theme.cardColor,
                        ),
                        onPressed: () {},
                        icon: Icon(
                          FluentIcons.subtract_24_regular,
                          color: theme.colorScheme.primary,
                        )),
                    Gap(kPadding16),
                    Text(
                      "1",
                      style: theme.textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.w800),
                    ),
                    Gap(kPadding16),
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: theme.cardColor,
                      ),
                      onPressed: () {},
                      icon: Icon(
                        FluentIcons.add_24_regular,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                Gap(kPadding16),
                Row(
                  children: [
                    Icon(
                      FluentIcons.wallet_24_regular,
                      color: theme.colorScheme.primary,
                    ),
                    Gap(kPadding8),
                    Text("12500 RWF",
                        style: theme.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w800,
                            color: theme.colorScheme.primary)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

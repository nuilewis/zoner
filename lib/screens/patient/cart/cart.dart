import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/core.dart';
import '../../components_global/components.dart';
import 'components/session_cart_item.dart';

class CartScreen extends StatelessWidget {
  static const String id = "cart";
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tabs
            ZonerAppBar(pageTitle: 'Cart'),
            Row(
              children: [
                ZonerChip(
                  label: 'Session',
                  chipType: AppChipType.filter,
                  onSelected: (selected) {},
                ),
                Gap(kPadding16),
                ZonerChip(
                  label: 'Labs',
                  chipType: AppChipType.filter,
                  onSelected: (selected) {},
                ),
                Gap(kPadding16),
                ZonerChip(
                  label: 'Medication',
                  chipType: AppChipType.filter,
                  onSelected: (selected) {},
                ),
              ],
            ),
            Gap(kPadding24),
            SessionCartItem(),
            Gap(kPadding16),
            MedicationCartItem(),
            Spacer(),

            // Total and Checkout
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: theme.textTheme.bodyMedium,
                    ),
                    Gap(kPadding8),
                    Text('8500 RWF',
                        style: theme.textTheme.titleLarge!.copyWith(
                            fontFamily: "Plus Jakarta Sans",
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w800)),
                  ],
                ),
                Gap(kPadding24),
                Expanded(
                    child: ZonerButton(onPressed: () {}, label: "Checkout"))
              ],
            ),

            Gap(kPadding64)
          ],
        ),
      ),
    );
  }
}

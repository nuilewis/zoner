import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/screens/patient/cart/components/payment_method_selector_item.dart';

import '../../../core/core.dart';
import '../../components_global/components.dart';
import 'components/lab_test_cart_item.dart';
import 'components/session_cart_item.dart';

class CartScreen extends StatelessWidget {
  static const String id = "cart";
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    //  final bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tabs
              const ZonerAppBar(pageTitle: 'Cart'),
              Row(
                children: [
                  ZonerChip(
                    label: 'Session',
                    chipType: AppChipType.filter,
                    onSelected: (selected) {},
                  ),
                  const Gap(kPadding16),
                  ZonerChip(
                    label: 'Labs',
                    chipType: AppChipType.filter,
                    onSelected: (selected) {},
                  ),
                  const Gap(kPadding16),
                  ZonerChip(
                    label: 'Medication',
                    chipType: AppChipType.filter,
                    onSelected: (selected) {},
                  ),
                ],
              ),
              const Gap(kPadding24),
              const SessionCartItem(),
              const Gap(kPadding16),
              const MedicationCartItem(),
              const Gap(kPadding16),
              LabTestCartItem(
                  testName: "Test Name", price: "200 RWF", onDelete: () {}),
              const Gap(kPadding32),
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
                      const Gap(kPadding8),
                      Text('8500 RWF',
                          style: theme.textTheme.titleLarge!.copyWith(
                              fontFamily: "Plus Jakarta Sans",
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w800)),
                    ],
                  ),
                  const Gap(kPadding24),
                  Expanded(
                    child: ZonerButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return ZonerBottomSheet(
                                  title: "How would you like yo pay?",
                                  onPressed: () {},
                                  child: const Column(
                                    children: [
                                      Gap(kPadding24),
                                      PaymentMethodSelectorItem(),
                                      Gap(kPadding16),
                                      PaymentMethodSelectorItem(),
                                    ],
                                  ),
                                );
                              });
                        },
                        label: "Continue"),
                  )
                ],
              ),

              const Gap(kPadding64)
            ],
          ),
        ),
      ),
    );
  }
}

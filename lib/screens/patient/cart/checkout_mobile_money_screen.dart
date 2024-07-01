import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:zoner/screens/patient/cart/checkout_success_screen.dart';
import 'package:zoner/screens/patient/cart/components/payment_method_selector_item.dart';

import '../../../core/core.dart';
import '../../shared/components_global/components.dart';

class CheckoutMobileMoneyScreen extends StatefulWidget {
  static const id = "checkout_momo";
  const CheckoutMobileMoneyScreen({super.key});

  @override
  State<CheckoutMobileMoneyScreen> createState() =>
      _CheckoutMobileMoneyScreenState();
}

class _CheckoutMobileMoneyScreenState extends State<CheckoutMobileMoneyScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    phoneNumberController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ZonerAppBar(pageTitle: "Checkout"),
              Align(
                alignment: Alignment.center,
                child: Text('You are about to make a payment of',
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center),
              ),
              const Gap(kPadding4),
              Align(
                alignment: Alignment.center,
                child: Text('8500 RWF',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge!.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Plus Jakarta Sans")),
              ),
              const Gap(kPadding24),
              PaymentMethodSelectorItem(
                onPressed: () {},
              ),
              const Gap(kPadding24),
              const Align(
                  alignment: Alignment.center,
                  child: Text("Or use another number")),
              const Gap(kPadding24),
              // Card Number
              const Text("Phone Number"),
              const Gap(kPadding8),
              TextFormField(
                controller: phoneNumberController,
                decoration:
                    ZonerInputDecoration.inputDecoration(context).copyWith(
                  hintText: 'Phone Number',
                ),
                keyboardType: TextInputType.number,
              ),
              const Gap(kPadding16),

              // Address
              const Text("Address"),
              const Gap(kPadding8),
              TextFormField(
                controller: addressController,
                decoration:
                    ZonerInputDecoration.inputDecoration(context).copyWith(
                  hintText: "Address",
                ),
                keyboardType: TextInputType.streetAddress,
              ),
              const Gap(kPadding16),

              // Save Card Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Save Number as Payment Method'),
                  const Spacer(),
                  Switch(
                      value: true,
                      onChanged: (value) {
                        // Handle switch change
                      },
                      activeColor: theme.colorScheme.primary),
                ],
              ),
              const Spacer(),

              // Checkout Button
              ZonerButton(
                onPressed: () {
                  // Handle checkout action
                  context.pushNamed(CheckoutSuccessScreen.id);
                },
                label: "Checkout",
              ),
              const Gap(kPadding64),
            ],
          ),
        ),
      ),
    );
  }
}

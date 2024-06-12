import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/core/constants.dart';
import 'package:zoner/screens/components_global/components.dart';

class CheckoutCardScreen extends StatefulWidget {
  static const id = "checkout_card";
  const CheckoutCardScreen({super.key});

  @override
  State<CheckoutCardScreen> createState() => _CheckoutCardScreenState();
}

class _CheckoutCardScreenState extends State<CheckoutCardScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvcController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryController.dispose();
    cvcController.dispose();
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

              // Card Number
              const Text("Card Number"),
              const Gap(kPadding8),
              TextFormField(
                controller: cardNumberController,
                decoration:
                    ZonerInputDecoration.inputDecoration(context).copyWith(
                  hintText: 'Card Number',
                ),
                keyboardType: TextInputType.number,
              ),
              const Gap(kPadding16),

              // Expiry and CVC
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Expiry"),
                        const Gap(kPadding8),
                        TextFormField(
                          controller: expiryController,
                          decoration:
                              ZonerInputDecoration.inputDecoration(context)
                                  .copyWith(
                            hintText: 'MM/YY',
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ],
                    ),
                  ),
                  const Gap(kPadding16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("CVV"),
                        const Gap(kPadding8),
                        TextFormField(
                          controller: cvcController,
                          decoration:
                              ZonerInputDecoration.inputDecoration(context)
                                  .copyWith(
                            hintText: 'CVV',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ],
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
                  const Text('Save Card as Payment Method'),
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

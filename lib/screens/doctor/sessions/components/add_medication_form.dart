import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/screens/doctor/sessions/components/custom_frequency_dialog.dart';

import '../../../../core/core.dart';
import '../../../shared/components_global/components.dart';
import 'custom_dose_dialog.dart';

class AddMedicationForm extends StatefulWidget {
  const AddMedicationForm({super.key});

  @override
  State<AddMedicationForm> createState() => _AddMedicationFormState();
}

class _AddMedicationFormState extends State<AddMedicationForm> {
  final TextEditingController medicationController = TextEditingController();

  @override
  void dispose() {
    medicationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius:
            const BorderRadius.vertical(top: Radius.circular(kPadding24)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: kPadding16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(kPadding16),
          Text("Add Medication Prescription",
              style: theme.textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.w800)),
          const Gap(kPadding24),
          TextFormField(
            controller: medicationController,
            decoration: ZonerInputDecoration.inputDecoration(context)
                .copyWith(hintText: "Add Medication"),
            onFieldSubmitted: (value) {},
          ),
          const Gap(kPadding16),
          const Text("Dose"),
          const Gap(kPadding16),
          Wrap(runSpacing: 6, spacing: kPadding8, children: [
            ...List.generate(
              3,
              (context) => ZonerChip(
                onSelected: (isSelected) {},
                label: "200mg",
                chipType: AppChipType.filter,
              ),
            ),
            ZonerChip(
              onSelected: (isSelected) {
                ///Show Alert Dialog
                showAdaptiveDialog(
                  context: context,
                  builder: (context) => const CustomDoseDialog(),
                );
              },
              label: "Custom",
              chipType: AppChipType.filter,
            ),
          ]),
          const Gap(kPadding24),
          const Text("Frequency"),
          Wrap(runSpacing: 6, spacing: kPadding8, children: [
            ...List.generate(
                3,
                (context) => ZonerChip(
                      onSelected: (isSelected) {},
                      label: "Once a day",
                      chipType: AppChipType.filter,
                    )),
            ZonerChip(
              onSelected: (isSelected) {
                ///Show Alert Dialog
                showAdaptiveDialog(
                    context: context,
                    builder: (context) => const CustomFrequencyDialog());
              },
              label: "Custom",
              chipType: AppChipType.filter,
            ),
          ]),
          const Gap(kPadding24),
          const Text("Duration"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kPadding24),
            child: Text(
              "Add Radio buttons here",
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: theme.colorScheme.primary),
            ),
          ),
          const Gap(kPadding16),
          ZonerButton(
              onPressed: () {
                //Todo: Add Medication
              },
              label: "Add Medication Prescription"),
          const Gap(kPadding64),
        ],
      ),
    );
  }
}

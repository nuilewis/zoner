import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';
import '../../../components_global/components.dart';

class HealthInfoScreen extends StatefulWidget {
  static const String id = "health_info";

  const HealthInfoScreen({super.key});

  @override
  State<HealthInfoScreen> createState() => _HealthInfoScreenState();
}

enum Gender { male, female }

class _HealthInfoScreenState extends State<HealthInfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController medicalConditionController =
      TextEditingController();
  final TextEditingController allergyController = TextEditingController();
  Gender selectedGenderValue = Gender.male;

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    medicalConditionController.dispose();
    allergyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const ZonerAppBar(pageTitle: "Health Info"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Full Names"),
                    const Gap(kPadding8),
                    TextFormField(
                      // initialValue: nameController.value.text,
                      controller: heightController,
                      keyboardType: TextInputType.number,
                      decoration: ZonerInputDecoration.inputDecoration(context)
                          .copyWith(hintText: "Height"),
                      validator: (value) {
                        ///Todo: probably find a better regex for validating emails
                        if (value == null || value.isEmpty) {
                          return "Please input a height";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(kPadding16),
                    const Text("Weight"),
                    const Gap(kPadding8),
                    TextFormField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration: ZonerInputDecoration.inputDecoration(context)
                          .copyWith(
                        hintText: "Age",
                      ),
                      validator: (value) {
                        ///Todo: probably find a better regex for validating emails
                        if (value == null || value.isEmpty) {
                          return "Please input your weight";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(kPadding16),
                    const Text("Medical Conditions"),
                    const Gap(kPadding8),
                    TextFormField(
                      controller: medicalConditionController,
                      keyboardType: TextInputType.streetAddress,
                      decoration: ZonerInputDecoration.inputDecoration(context)
                          .copyWith(
                              hintText: "e.g Diabetes",
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  FluentIcons.checkmark_24_regular,
                                  color: theme.colorScheme.primary,
                                ),
                              )),
                    ),
                    const Gap(4),
                    const Wrap(
                      spacing: 8,
                      children: [
                        ZonerChip(
                            chipType: AppChipType.info,
                            label: "High Blood Pressure"),
                        ZonerChip(
                            chipType: AppChipType.info, label: "Diabetes"),
                        ZonerChip(chipType: AppChipType.info, label: "Asthma"),
                      ],
                    ),
                    const Gap(kPadding16),
                    const Text("Allergies"),
                    const Gap(kPadding8),
                    TextFormField(
                      controller: allergyController,
                      keyboardType: TextInputType.streetAddress,
                      decoration: ZonerInputDecoration.inputDecoration(context)
                          .copyWith(
                              hintText: "e.g Dogs",
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  FluentIcons.checkmark_24_regular,
                                  color: theme.colorScheme.primary,
                                ),
                              )),
                    ),
                    const Gap(4),
                    const Wrap(
                      spacing: 8,
                      children: [
                        ZonerChip(
                            chipType: AppChipType.info,
                            label: "High Blood Pressure"),
                        ZonerChip(
                            chipType: AppChipType.info, label: "Diabetes"),
                        ZonerChip(chipType: AppChipType.info, label: "Asthma"),
                      ],
                    ),
                  ],
                ),
              ),
              const Gap(32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ZonerButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //Todo: Nav to next page
                      }
                    },
                    label: "Continue"),
              ),
              const Gap(kPadding64),
            ],
          ),
        ),
      ),
    );
  }
}

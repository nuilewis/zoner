import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/core.dart';
import '../../../../components_global/components.dart';

class DoctorVerificationScreen extends StatefulWidget {
  static const String id = "doctor_verification";

  const DoctorVerificationScreen({super.key});

  @override
  State<DoctorVerificationScreen> createState() =>
      _DoctorVerificationScreenState();
}

class _DoctorVerificationScreenState extends State<DoctorVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController medicalConditionController =
      TextEditingController();
  final TextEditingController associatedHospitalController =
      TextEditingController();
  Gender selectedGenderValue = Gender.male;

  @override
  void dispose() {
    experienceController.dispose();
    weightController.dispose();
    medicalConditionController.dispose();
    associatedHospitalController.dispose();
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
              const ZonerAppBar(pageTitle: "Doctor\nVerification"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Experience"),
                    const Gap(kPadding8),
                    TextFormField(
                      // initialValue: nameController.value.text,
                      controller: experienceController,
                      keyboardType: TextInputType.number,
                      decoration: ZonerInputDecoration.inputDecoration(context)
                          .copyWith(hintText: "Experience"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please input your experience";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(kPadding16),
                    const Text("Certifications"),
                    const Gap(kPadding8),
                    TextFormField(
                      controller: weightController,
                      keyboardType: TextInputType.number,
                      decoration: ZonerInputDecoration.inputDecoration(context)
                          .copyWith(
                              hintText: "Upload Document",
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    FluentIcons.attach_24_regular,
                                    color: theme.colorScheme.primary,
                                  ))),
                      validator: (value) {
                        ///Todo: probably find a better regex for validating emails
                        if (value == null || value.isEmpty) {
                          return "Please upload a document";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(4),
                    const Wrap(
                      spacing: 8,
                      children: [
                        ZonerChip(
                            chipType: AppChipType.info,
                            label: "Certificate.pdf"),
                      ],
                    ),
                    const Gap(kPadding16),
                    const Text("Associated Hospital"),
                    const Gap(kPadding8),
                    TextFormField(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => ZonerBottomSheet(
                            title: "Select Hospital",
                            onPressed: () {},
                            child: SizedBox(
                              height: MediaQuery.sizeOf(context).height * .3,
                              child: Stack(
                                children: [
                                  ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        const Gap(kPadding8),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        const HospitalListItem(),
                                    itemCount: 12,
                                  ),
                                  IgnorePointer(
                                    child: Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              theme.scaffoldBackgroundColor,
                                              theme.scaffoldBackgroundColor
                                                  .withOpacity(0),
                                              theme.scaffoldBackgroundColor
                                                  .withOpacity(0),
                                              theme.scaffoldBackgroundColor
                                                  .withOpacity(0),
                                              theme.scaffoldBackgroundColor,
                                            ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      controller: associatedHospitalController,
                      keyboardType: TextInputType.text,
                      decoration: ZonerInputDecoration.inputDecoration(context)
                          .copyWith(
                        hintText: "Associated Hospital",
                      ),
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

class HospitalListItem extends StatelessWidget {
  final bool isSelected;
  const HospitalListItem({super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? theme.cardColor : null,
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        "Bamenda Regional Hospital",
        style: theme.textTheme.bodyMedium!.copyWith(
            color:
                isSelected ? theme.colorScheme.primary : ZonerColors.neutral50),
      ),
    );
  }
}

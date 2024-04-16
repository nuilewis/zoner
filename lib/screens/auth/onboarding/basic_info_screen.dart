import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/screens/components_global/zoner_bottom_sheet.dart';

import '../../../core/core.dart';
import '../../components_global/components.dart';

class BasicInfoScreen extends StatefulWidget {
  static const String id = "basic_info";

  const BasicInfoScreen({super.key});

  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController sexController = TextEditingController();
  Gender selectedGenderValue = Gender.male;

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    addressController.dispose();
    sexController.dispose();
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
              const ZonerAppBar(pageTitle: "Basic Info"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Full Names"),
                    const Gap(8),
                    TextFormField(
                      // initialValue: nameController.value.text,
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: ZonerInputDecoration.inputDecoration(context)
                          .copyWith(hintText: "Full Names"),
                      validator: (value) {
                        ///Todo: probably find a better regex for validating emails
                        if (value == null || value.isEmpty) {
                          return "Please input a name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(16),
                    const Text("Age"),
                    const Gap(8),
                    TextFormField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: ZonerInputDecoration.inputDecoration(context)
                          .copyWith(
                        hintText: "Age",
                      ),
                      validator: (value) {
                        ///Todo: probably find a better regex for validating emails
                        if (value == null || value.isEmpty) {
                          return "Please input your age";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(16),
                    const Text("Address"),
                    const Gap(8),
                    TextFormField(
                      controller: addressController,
                      keyboardType: TextInputType.streetAddress,
                      decoration: ZonerInputDecoration.inputDecoration(context)
                          .copyWith(hintText: "Email"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please input your address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(16),
                    const Text("Sex"),
                    const Gap(8),
                    TextFormField(
                      onTap: () async {
                        await showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return ZonerBottomSheet(
                                  title: "Sex",
                                  onPressed: () {},
                                  child: Column(
                                    children: [
                                      RadioListTile<Gender>.adaptive(
                                          title: const Text("Male"),
                                          activeColor:
                                              theme.colorScheme.primary,
                                          value: Gender.male,
                                          groupValue: selectedGenderValue,
                                          selected: selectedGenderValue ==
                                              Gender.male,
                                          onChanged: (Gender? value) {
                                            setState(() {
                                              selectedGenderValue = value!;
                                            });
                                          }),
                                      RadioListTile<Gender>.adaptive(
                                          title: const Text("Female"),
                                          activeColor:
                                              theme.colorScheme.primary,
                                          value: Gender.female,
                                          groupValue: selectedGenderValue,
                                          selected: selectedGenderValue ==
                                              Gender.female,
                                          onChanged: (Gender? value) {
                                            setState(() {
                                              selectedGenderValue = value!;
                                            });
                                          }),
                                    ],
                                  ));
                            });
                      },
                      controller: sexController,
                      keyboardType: TextInputType.name,
                      decoration: ZonerInputDecoration.inputDecoration(context)
                          .copyWith(hintText: "Sex"),
                      validator: (value) {
                        ///Todo: probably find a better regex for validating emails
                        if (value == null || value.isEmpty) {
                          return "Please input your sex";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(16),
                  ],
                ),
              ),
              //   const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ZonerButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            //Todo: Nav to next page
                          }
                        },
                        label: "Continue"),
                    const Gap(16),
                    const Gap(64),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

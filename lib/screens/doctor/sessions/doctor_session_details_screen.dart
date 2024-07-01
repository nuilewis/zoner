import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/core/core.dart';
import 'package:zoner/screens/doctor/sessions/components/add_medication_form.dart';
import 'package:zoner/screens/patient/sessions/components/components.dart';
import 'package:zoner/screens/shared/components_global/components.dart';

class DoctorSessionDetailsScreen extends StatefulWidget {
  static const String id = "session_details";
  const DoctorSessionDetailsScreen({super.key, this.isEditingMode = true});
  final bool isEditingMode;

  @override
  State<DoctorSessionDetailsScreen> createState() =>
      _DoctorSessionDetailsScreenState();
}

class _DoctorSessionDetailsScreenState
    extends State<DoctorSessionDetailsScreen> {
  final TextEditingController doctorRemarksController = TextEditingController();
  final TextEditingController labTestController = TextEditingController();

  @override
  void dispose() {
    doctorRemarksController.dispose();
    labTestController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ZonerAppBar(pageTitle: "Session Details"),
              const Gap(kPadding48),
              const DoubleAvatar(
                  imagePath1: "assets/images/memoji.jpg",
                  imagePath2: "assets/images/memoji.png"),
              Text(
                "Dr Lucy Lu",
                style: theme.textTheme.titleMedium,
              ),
              Text("Generalist",
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: ZonerColors.neutral50)),
              const Gap(kPadding12),
              Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kPadding16, vertical: kPadding12),
                  decoration: BoxDecoration(
                      color: ZonerColors.green95,
                      borderRadius: BorderRadius.circular(kPadding24)),
                  child: const Text("Ongoing")),
              const Gap(kPadding16),
              const HorizontalDetailsItem(
                label: "Date",
                content: "October 2023",
                icon: FluentIcons.calendar_24_regular,
              ),
              const HorizontalDetailsItem(
                label: "Date",
                content: "October 2023",
                icon: FluentIcons.calendar_24_regular,
              ),
              const Gap(kPadding24),

              ///Doctor's Remarks
              Visibility(
                visible: !widget.isEditingMode,
                replacement: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Doctor's Remarks",
                      style: theme.textTheme.titleLarge,
                    ),
                    const Gap(kPadding16),
                    TextFormField(
                        maxLines: 4,
                        controller: doctorRemarksController,
                        decoration:
                            ZonerInputDecoration.inputDecoration(context)
                                .copyWith(
                          hintText: "Doctor's Remarks",
                        )),
                  ],
                ),
                child: Container(
                  padding: const EdgeInsets.all(kPadding16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kPadding24),
                      border: Border.all(
                          width: 1,
                          color: isDarkMode
                              ? ZonerColors.neutral20
                              : ZonerColors.neutral90)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ZonerIcon(
                            icon: FluentIcons.person_24_regular,
                          ),
                          const Gap(kPadding8),
                          Text(
                            "Doctor's Remarks",
                            style: theme.textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      const Gap(kPadding16),
                      const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per"),
                    ],
                  ),
                ),
              ),

              const Gap(kPadding24),

              ///Prescriptions
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Prescriptions",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              const Gap(kPadding16),
              // ExpansionTile(
              //   initiallyExpanded: true,
              //   title: Text("Prescribed Tests",
              //       style: theme.textTheme.bodyLarge!
              //           .copyWith(fontWeight: FontWeight.w800)),
              //   leading: const ZonerIcon(
              //     icon: FluentIcons.beaker_24_regular,
              //   ),
              //   children: const [
              //     SessionMedicationListItem(medName: "Thoracic CT Scan"),
              //     SessionMedicationListItem(medName: "Malaria"),
              //     SessionMedicationListItem(
              //         medName: "Abdominal Endoplasmic Biopsy"),
              //   ],
              // ),
              // const Gap(kPadding16),
              ExpansionTile(
                initiallyExpanded: true,
                title: Text("Prescribed Medication",
                    style: theme.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w800)),
                leading: const ZonerIcon(
                  icon: FluentIcons.pill_16_regular,
                ),
                children: [
                  const SessionMedicationListItem(
                    medName: "Arthemeter",
                  ),
                  const SessionMedicationListItem(
                    medName: "PCM",
                  ),
                  const SessionMedicationListItem(
                    medName: "Allupurinol",
                  ),
                  const Gap(kPadding16),
                  ZonerButton(
                    buttonType: AppButtonType.outline,
                    //  isChipButton: true,
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => const AddMedicationForm());
                    },
                    label: "Add Medication Prescription",
                    iconPath: "assets/svg/medication.svg",
                  ),
                  const Gap(kPadding12),
                ],
              ),
              const Gap(kPadding24),

              ///Results
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Results",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              const Gap(kPadding16),
              ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  "Tests Results",
                  style: theme.textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w800),
                ),
                leading: const ZonerIcon(
                  icon: FluentIcons.beaker_24_regular,
                ),
                children: [
                  TextFormField(
                    controller: labTestController,
                    decoration: ZonerInputDecoration.inputDecoration(context)
                        .copyWith(
                            hintText: "Add Lab Test",
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(FluentIcons.add_24_regular))),
                    onFieldSubmitted: (value) {},
                  ),
                  const Gap(kPadding16),

                  ///Todo: replace this with the doctor version that has editing functionality
                  ///Might just combine all into one
                  const SessionTestListItem(testName: "Thoracic CT Scan"),
                  const SessionTestListItem(testName: "Malaria"),
                  const SessionTestListItem(
                      testName: "Abdominal Endoplasmic Biopsy"),
                ],
              ),
              const Gap(kPadding64),
            ],
          ),
        ),
      ),
    );
  }
}

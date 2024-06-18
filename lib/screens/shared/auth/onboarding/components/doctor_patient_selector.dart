import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../../../../../core/core.dart';
import 'doctor_patient_selector_card.dart';

class DoctorPatientSelector extends StatefulWidget {
  const DoctorPatientSelector({super.key, required this.selectedUserType});

  final void Function(UserType userType) selectedUserType;

  @override
  State<DoctorPatientSelector> createState() => _DoctorPatientSelectorState();
}

class _DoctorPatientSelectorState extends State<DoctorPatientSelector> {
  Map<int, bool> isCardSelected = {};
  UserType selectedUser = UserType.patient;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => const Gap(kPadding16),
        itemCount: UserType.values.length,
        itemBuilder: (context, index) {
          isCardSelected.putIfAbsent(index, () => false);
          return DoctorPatientSelectorCard(
            isSelected: isCardSelected[index]!,
            userType: UserType.values[index],
            onPressed: () {
              HapticFeedback.mediumImpact();
              isCardSelected.updateAll((key, value) => false);
              isCardSelected.update(index, (value) => !isCardSelected[index]!);
              setState(() {});
              widget.selectedUserType.call(UserType.values[index]);
            },
          );
        });
  }
}

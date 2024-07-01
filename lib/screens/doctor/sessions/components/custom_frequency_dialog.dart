import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../patient/consultation/components/calendar_week_day_selector.dart';
import '../../../shared/components_global/components.dart';

class CustomFrequencyDialog extends StatefulWidget {
  const CustomFrequencyDialog({super.key});

  @override
  State<CustomFrequencyDialog> createState() => _CustomFrequencyDialogState();
}

const List<String> dropdownMenuItems = ["Day", "Week", "Month", "Year"];

class _CustomFrequencyDialogState extends State<CustomFrequencyDialog> {
  String? dropdownValue = dropdownMenuItems.first;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AlertDialog.adaptive(
      contentPadding: const EdgeInsets.all(16),
      surfaceTintColor: Colors.transparent,
      backgroundColor: theme.scaffoldBackgroundColor,
      titlePadding: const EdgeInsets.only(
        top: 16,
        left: 16,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kPadding24)),
      title: Text(
        "Custom Frequency",
        style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w800),
      ),
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Repeats Every"),
            const Gap(kPadding16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: ZonerInputDecoration.inputDecoration(context)
                        .copyWith(hintText: "e.g 2"),
                  ),
                ),
                const Gap(kPadding16),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 48,
                    child: DropdownMenu(

                        //  menuHeight: 40,
                        menuStyle: MenuStyle(
                            padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
                              EdgeInsets.zero,
                            ),
                            //     surfaceTintColor: WidgetStatePropertyAll<Color>(Colors.red),
                            backgroundColor: WidgetStatePropertyAll<Color>(
                                theme.colorScheme.surface),
                            elevation: const WidgetStatePropertyAll<double>(20),
                            shape: WidgetStatePropertyAll<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(kPadding16)))),
                        inputDecorationTheme:
                            ZonerInputDecoration.inputDecorationTheme(context),
                        initialSelection: dropdownValue,
                        onSelected: (value) {
                          dropdownValue = value;
                        },
                        trailingIcon: const Icon(FluentIcons.chevron_down_24_regular),
                        selectedTrailingIcon:
                            const Icon(FluentIcons.chevron_up_24_regular),
                        dropdownMenuEntries: dropdownMenuItems
                            .map<DropdownMenuEntry<String>>((element) =>
                                DropdownMenuEntry<String>(
                                    value: element, label: element))
                            .toList()),
                  ),
                ),
              ],
            ),
            const Gap(kPadding12),
            CalendarWeekDaySelector(
                selectedDays: (List<String> selectedDays) {}),
          ],
        ),
      ),
      actions: [
        FittedBox(
          child: ZonerButton(
            isChipButton: true,
            onPressed: () {
              context.pop();
            },
            label: "Cancel",
            color: theme.colorScheme.error,
            buttonType: AppButtonType.text,
          ),
        ),
        FittedBox(
          child: ZonerButton(
            isChipButton: true,
            onPressed: () {},
            label: "Done",
            buttonType: AppButtonType.text,
          ),
        ),
      ],
    );
  }
}

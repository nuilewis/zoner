import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:zoner/core/core.dart';
import 'package:zoner/screens/shared/components_global/components.dart';

class CustomDoseDialog extends StatelessWidget {
  const CustomDoseDialog({super.key});

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
        "Custom Dose",
        style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w800),
      ),
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Custom Dose"),
            const Gap(kPadding12),
            TextFormField(
              decoration: ZonerInputDecoration.inputDecoration(context)
                  .copyWith(hintText: "Dose"),
            ),
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

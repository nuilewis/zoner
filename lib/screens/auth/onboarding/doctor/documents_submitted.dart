import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/screens/components_global/components.dart';

class DocumentsSubmittedScreen extends StatelessWidget {
  static const String id = "documents_submitted";

  const DocumentsSubmittedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Documents\nSubmitted",
              style: theme.textTheme.displayMedium!
                  .copyWith(color: theme.colorScheme.primary, height: 1.2),
            ),
            const Gap(16),
            const Text(
              "You will recieve a mail shortly when approved.",
            ),
            const Gap(64),
            ZonerButton(onPressed: () {}, label: "Awesome!"),
            const Gap(64),
          ],
        ),
      ),
    );
  }
}

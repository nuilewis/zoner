import 'package:flutter/material.dart';
import 'package:zoner/core/constants.dart';
import 'package:zoner/screens/components_global/components.dart';
import 'package:zoner/screens/patient/discover/qr_result_profile.dart';

class ScanQrScreen extends StatelessWidget {
  static const id = "scan_qr";
  const ScanQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding16),
        child: Column(
          children: [
            const ZonerAppBar(pageTitle: "Scan QR"),
            const Spacer(),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => const QrResultProfile());
              },
              child: Container(
                height: MediaQuery.sizeOf(context).width * .6,
                width: MediaQuery.sizeOf(context).width * .6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kPadding24),
                    color: theme.cardColor,
                    border:
                        Border.all(color: theme.colorScheme.primary, width: 2)),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}

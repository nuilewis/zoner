import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:zoner/core/core.dart';
import 'package:zoner/screens/patient/sessions/components/components.dart';
import 'package:zoner/screens/patient/sessions/session_details_screen.dart';

import '../../shared/components_global/components.dart';

class DoctorSessionsScreen extends StatelessWidget {
  static const id = "doctor_session";
  const DoctorSessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kPadding16),
              child: ZonerAppBar(pageTitle: "Sessions"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: kPadding16),
              child: Text(
                "Session Requests",
                style: theme.textTheme.titleLarge,
              ),
            ),
            const Gap(kPadding16),
            SizedBox(
              height: 185,
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: kPadding16),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return const Gap(kPadding16);
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return SessionCard(
                      onPressed: () {
                        context.pushNamed(SessionDetailsScreen.id);
                      },
                      sessionState: SessionState.request,
                    );
                  }),
            ),
            const Gap(kPadding24),
            Padding(
              padding: const EdgeInsets.only(left: kPadding16),
              child: Text(
                "Ongoing Sessions",
                style: theme.textTheme.titleLarge,
              ),
            ),
            const Gap(kPadding16),
            SizedBox(
              height: 166,
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: kPadding16),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return const Gap(kPadding16);
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return SessionCard(
                      onPressed: () {
                        context.pushNamed(SessionDetailsScreen.id);
                      },
                      sessionState: SessionState.ongoing,
                    );
                  }),
            ),
            const Gap(kPadding24),
            Padding(
              padding: const EdgeInsets.only(left: kPadding16),
              child: Text(
                "Previous Sessions",
                style: theme.textTheme.titleLarge,
              ),
            ),
            const Gap(kPadding16),
            ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: kPadding16),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return const Gap(kPadding16);
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return SessionCard(
                    onPressed: () {
                      context.pushNamed(SessionDetailsScreen.id);
                    },
                    sessionState: SessionState.completed,
                  );
                }),
            const Gap(kPadding64),
          ],
        ),
      ),
    );
  }
}

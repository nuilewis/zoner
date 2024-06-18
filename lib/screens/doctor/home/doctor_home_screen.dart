import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:zoner/screens/patient/sessions/components/session_card.dart';
import 'package:zoner/screens/patient/sessions/session_details_screen.dart';

import '../../../core/core.dart';
import '../../components_global/components.dart';

///Todo: Will probably merge the homescreens into one,and use checks on UserType to display appropriate widgets
class DoctorHomeScreen extends StatelessWidget {
  static const String id = "doctor_home";
  const DoctorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    //   final bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(kPadding24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kPadding16),
                child: ProfileImageAppBar(),
              ),
              const Gap(kPadding48),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: kPadding16),
                padding: const EdgeInsets.all(kPadding16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kPadding24),
                  color: theme.colorScheme.primary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Finish setting up your profile to get started",
                      style: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.scaffoldBackgroundColor,
                          fontWeight: FontWeight.w600),
                    ),
                    const Gap(kPadding24),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FittedBox(
                        child: ZonerButton(
                            color: theme.scaffoldBackgroundColor,
                            onPressed: () {},
                            buttonType: AppButtonType.outline,
                            isChipButton: true,
                            label: "Lets Go!"),
                      ),
                    )
                  ],
                ),
              ),
              const Gap(kPadding24),
              Padding(
                padding: const EdgeInsets.only(left: kPadding16),
                child: Text(
                  "Session Requests",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              const Gap(kPadding8),
              SizedBox(
                height: 195,
                child: CustomScrollView(
                  scrollDirection: Axis.horizontal,
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.only(left: kPadding16),
                      sliver: SliverPrototypeExtentList.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) => FittedBox(
                                child: SessionCard(
                                  margin:
                                      const EdgeInsets.only(right: kPadding16),
                                  sessionState: SessionState.request,
                                  onPressed: () {
                                    context.pushNamed(SessionDetailsScreen.id);
                                  },
                                ),
                              ),
                          prototypeItem: SessionCard(
                            onPressed: () {
                              context.pushNamed(SessionDetailsScreen.id);
                            },
                            margin: const EdgeInsets.only(right: kPadding16),
                            sessionState: SessionState.request,
                          )),
                    ),
                  ],
                ),
              ),
              const Gap(kPadding24),
              Padding(
                padding: const EdgeInsets.only(left: kPadding16),
                child: Text(
                  "Ongoing Sessions",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              const Gap(kPadding8),
              SizedBox(
                height: 180,
                child: CustomScrollView(
                  scrollDirection: Axis.horizontal,
                  //   physics: AlwaysScrollableScrollPhysics(),
                  restorationId: "ongoing_sessions_list",
                  slivers: [
                    SliverPadding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: kPadding16),
                      sliver: SliverPrototypeExtentList.builder(
                        itemBuilder: (context, index) => FittedBox(
                          child: SessionCard(
                            onPressed: () {
                              context.pushNamed(SessionDetailsScreen.id);
                            },
                            margin: const EdgeInsets.only(right: kPadding16),
                          ),
                        ),
                        prototypeItem: SessionCard(
                          onPressed: () {
                            context.pushNamed(SessionDetailsScreen.id);
                          },
                          margin: const EdgeInsets.only(right: kPadding16),
                        ),
                        itemCount: 3,
                      ),
                    )
                  ],
                ),
              ),
              const Gap(kPadding24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding16),
                child: ZonerButton(
                  onPressed: () {},
                  label: "Scan QR Code",
                  icon: FluentIcons.qr_code_24_filled,
                  color: theme.scaffoldBackgroundColor,
                ),
              ),
              const Gap(kPadding32),

              ///Graphs here

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Statistics",
                      style: theme.textTheme.titleLarge,
                    ),
                    const Gap(kPadding16),
                    const Row(
                      children: [
                        ZonerIcon(
                          icon: FluentIcons.people_24_regular,
                        ),
                        Gap(kPadding8),
                        Text(
                          "Consulations this week",
                        ),
                      ],
                    ),
                    const Gap(kPadding16),
                    Text(
                      "37",
                      style: theme.textTheme.displayMedium!.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),

              const Gap(kPadding16),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kPadding24),
                    color: theme.cardColor),
                width: double.infinity,
                height: 150,
                margin: const EdgeInsets.symmetric(horizontal: kPadding16),
                child: const Center(
                  child: Text("Build graph here"),
                ),
              ),
              const Gap(kPadding24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Latest articles",
                      style: theme.textTheme.titleLarge,
                    )),
              ),
              const Gap(kPadding8),
              SizedBox(
                height: 248,
                child: CustomScrollView(
                    scrollDirection: Axis.horizontal,
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.only(left: kPadding16),
                        sliver: SliverPrototypeExtentList.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return const FittedBox(
                                child: ArticleCard(
                              margin: EdgeInsets.only(right: kPadding16),
                            ));
                          },
                          prototypeItem: const ArticleCard(),
                        ),
                      ),
                    ]),
              ),
              const Gap(kPadding64),
            ],
          ),
        ),
      ),
    );
  }
}

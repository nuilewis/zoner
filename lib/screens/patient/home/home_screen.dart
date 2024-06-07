import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/screens/patient/sessions/components/session_card.dart';

import '../../../core/core.dart';
import '../../doctor/profile/components/components.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "home";
  const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     final bool isDarkMode = theme.brightness == Brightness.dark;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             children: [
//               Container(
//                 height: 300,
//                 color: Colors.blue,
//               ),
//               Container(
//                 height: 300,
//                 color: Colors.red,
//                 child: CustomScrollView(
//                   scrollDirection: Axis.horizontal,
//                   slivers: [
//                     SliverPrototypeExtentList.builder(
//                         itemBuilder: (context, index) => FittedBox(
//                               child: SessionCard(
//                                 sessionState: SessionState.request,
//                               ),
//                             ),
//                         itemCount: 3,
//                         prototypeItem: SessionCard(
//                           sessionState: SessionState.request,
//                         )),
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 800,
//                 color: Colors.green,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(kPadding24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kPadding16),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage("assets/images/memoji.jpg"),
                    ),
                    const Gap(kPadding16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Welcome",
                          style: theme.textTheme.bodyMedium,
                        ),
                        const Gap(4),
                        Text("Dave", style: theme.textTheme.headlineSmall)
                      ],
                    ),
                    const Spacer(),
                    IconButton.filled(
                        style: IconButton.styleFrom(
                          backgroundColor: isDarkMode
                              ? ZonerColors.neutral20
                              : ZonerColors.neutral95,
                        ),
                        onPressed: () {},
                        icon: const Icon(FluentIcons.list_rtl_20_regular))
                  ],
                ),
              ),
              const Gap(kPadding48),
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
                          itemBuilder: (context, index) => const FittedBox(
                                child: SessionCard(
                                  margin: EdgeInsets.only(right: kPadding16),
                                  sessionState: SessionState.request,
                                ),
                              ),
                          prototypeItem: const SessionCard(
                            margin: EdgeInsets.only(right: kPadding16),
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
                      padding: const EdgeInsets.symmetric(horizontal: kPadding16),
                      sliver: SliverPrototypeExtentList.builder(
                        itemBuilder: (context, index) => const FittedBox(
                          child: SessionCard(
                            margin: EdgeInsets.only(right: kPadding16),
                          ),
                        ),
                        prototypeItem: const SessionCard(
                          margin: EdgeInsets.only(right: kPadding16),
                        ),
                        itemCount: 3,
                      ),
                    )
                  ],
                ),
              ),
              const Gap(kPadding32),
              Padding(
                padding: const EdgeInsets.only(left: kPadding16),
                child: Text(
                  "Discover",
                  style: theme.textTheme.titleLarge,
                ),
              ),
              const Gap(kPadding16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  const Gap(kPadding16),
                  LargePillChips(
                      color: theme.colorScheme.primary,
                      label: "Doctors",
                      icon: FluentIcons.person_24_filled),
                  const Gap(kPadding16),
                  LargePillChips(
                      color: theme.colorScheme.primary,
                      label: "Hospitals",
                      iconPath: "assets/svg/hospital-filled.svg"),
                  const Gap(kPadding16),
                  LargePillChips(
                      color: theme.colorScheme.primary,
                      label: "Labs",
                      icon: FluentIcons.beaker_24_filled),
                  const Gap(kPadding16),
                  LargePillChips(
                      color: theme.colorScheme.primary,
                      label: "Pharmacies",
                      icon: FluentIcons.pill_24_filled),
                  const Gap(kPadding16),
                ]),
              ),
              const Gap(32),
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

class ArticleCard extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  const ArticleCard({super.key, this.margin});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      margin: margin,
      width: MediaQuery.sizeOf(context).width * .8,
      child: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * .8,
            height: 190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: theme.cardColor,
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 8,
                  top: 8,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton.filled(
                        onPressed: () {},
                        icon: const Icon(
                          FluentIcons.heart_20_regular,
                        ),
                        style: IconButton.styleFrom(
                            backgroundColor: theme.scaffoldBackgroundColor),
                      ),
                      const Gap(4),
                      IconButton.filled(
                        onPressed: () {},
                        icon: const Icon(
                          FluentIcons.share_ios_20_regular,
                        ),
                        style: IconButton.styleFrom(
                            backgroundColor: theme.scaffoldBackgroundColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap(kPadding16),
          Text(
            "12 Fruits and Vegetables, to help boost, your immune system",
            style: theme.textTheme.bodyMedium,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}

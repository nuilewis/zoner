import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/screens/components_global/components.dart';

import '../../../core/core.dart';
import 'components/components.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(24),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundImage:
                              AssetImage("assets/images/memoji.png"),
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
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(FluentIcons.list_rtl_20_regular))
                      ],
                    ),
                    const Gap(24),
                    Text(
                      "Ongoing Consultation",
                      style: theme.textTheme.titleMedium,
                    ),
                    const Gap(kPadding16),
                    const ConsultationCard(),
                    const Gap(32),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Diagnose",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    const Gap(kPadding8),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const Gap(kPadding16),
                    ConsultationCTACard(
                      onPressed: () {
                        ///Todo: start consultation Flow
                      },
                      label: "Consult\n with AI",
                      labelColor: ZonerColors.orange60,
                    ),
                    const Gap(kPadding16),
                    ConsultationCTACard(
                      onPressed: () {
                        ///Todo: start consultation Flow
                      },
                      backgroundColor: theme.cardColor,
                      labelColor: theme.primaryColor,
                    ),
                    const Gap(kPadding16),
                  ],
                ),
              ),
              const Gap(24),

              ///Discover CTA Card
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: theme.cardColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Discover Hospitals,\nPharmacies & Labs",
                      style: theme.textTheme.headlineSmall!.copyWith(
                          color: theme.colorScheme.onPrimaryContainer,
                          height: 1.4),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FittedBox(
                        child: ZonerButton(
                            trailingIcon: FluentIcons.arrow_right_24_regular,
                            isChipButton: true,
                            onPressed: () {},
                            label: "Discover"),
                      ),
                    )
                  ],
                ),
              ),
              const Gap(32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Latest articles",
                      style: theme.textTheme.titleMedium,
                    )),
              ),
              const Gap(kPadding16),
              SizedBox(
                height: 216,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Gap(kPadding16);
                  },
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const ArticleCard();
                  },
                ),
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
  const ArticleCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .8,
      child: Column(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * .8,
            height: 160,
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

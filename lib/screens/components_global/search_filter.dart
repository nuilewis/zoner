import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

import '../../core/core.dart';
import '../patient/consultation/components/components.dart';
import 'components.dart';

class SearchFilter extends StatefulWidget {
  final VoidCallback onClosedPressed;
  const SearchFilter({
    super.key,
    required this.onClosedPressed,
  });

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton.filled(
              style: IconButton.styleFrom(
                fixedSize: const Size.square(12),
                padding: EdgeInsets.zero,
                // backgroundColor: theme.cardColor,
              ),
              onPressed: () {
                _animationController.reverse();
                Future.delayed(150.ms, () => widget.onClosedPressed.call());
              },
              icon: const Icon(
                size: 20,
                FluentIcons.dismiss_16_regular,
                color: Colors.white,
              ),
            ),
          ).animate(controller: _animationController).moveY(
              delay: 200.ms,
              duration: 200.ms,
              begin: 60,
              end: 0,
              curve: Curves.decelerate),
          const Gap(kPadding8),
          Container(
            decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(kPadding24),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 10,
                      spreadRadius: 5)
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kPadding24),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: kPadding16,
                    right: kPadding16,
                    top: kPadding16,
                    bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "I'm Looking for",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w800,
                        color: ZonerColors.neutral50,
                      ),
                    ),
                    Wrap(
                      spacing: kPadding8,
                      runSpacing: -4,
                      children: [
                        ZonerChip(
                            onSelected: (isSelected) {},
                            label: "Hospitals",
                            iconPath: "assets/svg/hospital.svg"),
                        ZonerChip(
                            onSelected: (isSelected) {},
                            label: "Medication",
                            icon: FluentIcons.pill_16_regular),
                        ZonerChip(
                            onSelected: (isSelected) {},
                            label: "Lab Tests",
                            icon: FluentIcons.beaker_16_regular),
                        ZonerChip(
                            onSelected: (isSelected) {},
                            label: "Doctors",
                            icon: FluentIcons.person_16_regular),
                      ],
                    ),
                    const Gap(kPadding16),
                    Text(
                      "Specialisation",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w800,
                        color: ZonerColors.neutral50,
                      ),
                    ),
                    Wrap(
                      spacing: kPadding8,
                      runSpacing: -4,
                      children: [
                        ZonerChip(
                            onSelected: (isSelected) {},
                            label: "Generalist",
                            icon: FluentIcons.pill_16_regular),
                        ZonerChip(
                          onSelected: (isSelected) {},
                          label: "Specialist",
                          icon: FluentIcons.beaker_16_regular,
                        ),
                        ZonerChip(
                          onSelected: (isSelected) {},
                          label: "Associated with Hospital",
                          icon: FluentIcons.person_16_regular,
                        ),
                      ],
                    ),
                    const Gap(kPadding16),
                    Text(
                      "Search Specialisation",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w800,
                        color: ZonerColors.neutral50,
                      ),
                    ),
                    const Gap(kPadding8),
                    const ZonerSearchBar(),
                    const Gap(kPadding8),
                    SizedBox(
                      height: 220,
                      child: ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              const FilterSearchResultListItem(
                                label: "Dentist",
                                icon: FluentIcons.person_16_regular,
                              ),
                          separatorBuilder: (context, index) => const Divider(
                                thickness: 1,
                                color: ZonerColors.neutral95,
                              ),
                          itemCount: 10),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

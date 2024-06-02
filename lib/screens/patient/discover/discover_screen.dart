import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/core/core.dart';
import 'package:zoner/screens/components_global/components.dart';

class DiscoverScreen extends StatelessWidget {
  static const String id = "discover";
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: Column(
        children: [
          const ZonerAppBar(pageTitle: "Discover"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SearchBar(
                        padding: const WidgetStatePropertyAll<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 16)),
                        leading: const Icon(
                          FluentIcons.search_24_regular,
                          color: ZonerColors.neutral50,
                        ),
                        backgroundColor: WidgetStatePropertyAll<Color>(
                            isDarkMode
                                ? ZonerColors.neutral20
                                : ZonerColors.neutral95),
                        hintText: "Search",
                        hintStyle: WidgetStatePropertyAll<TextStyle>(theme
                            .textTheme.bodyMedium!
                            .copyWith(color: ZonerColors.neutral50)),
                        elevation: const WidgetStatePropertyAll<double>(0),
                        constraints: BoxConstraints.tight(
                            const Size(double.infinity, 48)),
                      ),
                    ),
                    const Gap(kPadding16),
                    IconButton.filled(
                        style: IconButton.styleFrom(
                          backgroundColor: isDarkMode
                              ? ZonerColors.neutral20
                              : ZonerColors.neutral95,
                          fixedSize: const Size.square(48),
                          splashFactory: InkSparkle.splashFactory,
                        ),
                        onPressed: () {
                          ///Todo: Change to Map
                        },
                        icon: const Icon(FluentIcons.map_24_regular))
                  ],
                ),
                const Gap(kPadding8),
                Row(
                  children: [
                    IconButton.filled(
                        style: IconButton.styleFrom(
                          backgroundColor: isDarkMode
                              ? ZonerColors.neutral20
                              : ZonerColors.neutral95,
                          fixedSize: const Size.square(34),
                          splashFactory: InkSparkle.splashFactory,
                        ),
                        onPressed: () {
                          ///Todo: Change to Map
                        },
                        icon: const Icon(FluentIcons.filter_24_regular)),
                    const Gap(kPadding8),
                    Wrap(
                      spacing: 8,
                      children: [
                        ZonerChip(
                            icon: FluentIcons.crop_sparkle_24_filled,
                            chipType: AppChipType.filter,
                            onSelected: (selected) {
                              ///Todo: Dismiss Chip
                            },
                            label: "Hospital"),
                        ZonerChip(
                            icon: FluentIcons.content_settings_20_regular,
                            chipType: AppChipType.info,
                            onSelected: (selected) {
                              ///Todo: Dismiss Chip
                            },
                            label: "Hospital"),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/core.dart';

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

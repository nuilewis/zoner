import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';

class PurchaseDetailsLstItem extends StatelessWidget {
  final String label;
  final String content;
  final String? iconPath;
  final IconData? icon;
  final Color? color;
  const PurchaseDetailsLstItem(
      {super.key,
      required this.label,
      required this.content,
      this.iconPath,
      this.icon,
      this.color});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    if (icon != null && iconPath != null) {
      throw ErrorHint(
          "Cannot provide both an 'icon' and an 'iconPath' property, consider removing one");
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kPadding12),
      child: Row(
        children: [
          Row(
            children: [
              Visibility(
                visible: icon != null || iconPath != null,
                child: icon != null
                    ? Icon(
                        icon,
                        color: color ?? ZonerColors.neutral50,
                      )
                    : SvgPicture.asset(iconPath ?? "",
                        colorFilter: ColorFilter.mode(
                            color ?? ZonerColors.neutral50, BlendMode.srcIn)),
              ),
              const Gap(kPadding8),
              Text(
                label,
                style: theme.textTheme.bodyMedium!
                    .copyWith(color: ZonerColors.neutral50),
              )
            ],
          ),
          const Spacer(),
          Text(
            content,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w800,
              //  color: theme.colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}

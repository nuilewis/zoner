import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class IconText extends StatelessWidget {
  final String label;
  final String? iconPath;
  final IconData? icon;
  final Color? color;
  const IconText(
      {super.key, required this.label, this.iconPath, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    if (icon != null && iconPath != null) {
      throw ErrorHint(
          "Cannot provide both an 'icon' and an 'iconPath' property, consider removing one");
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: icon != null || iconPath != null,
          child: icon != null
              ? Icon(
                  icon,
                  color: color ?? theme.colorScheme.primary,
                  size: 20,
                )
              : SvgPicture.asset(iconPath ?? "",
                  height: 20,
                  colorFilter: ColorFilter.mode(
                      color ?? theme.colorScheme.primary, BlendMode.srcIn)),
        ),
        const Gap(4),
        Text(
          label,
          style: theme.textTheme.bodyMedium!
              .copyWith(color: color ?? theme.colorScheme.primary),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../core/core.dart';

class ZonerButton extends StatelessWidget {
  const ZonerButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color,
    this.backgroundColor,
    this.iconPath,
    this.icon,
    this.trailingIcon,
    this.trailingIconPath,
    this.overrideIconColor = false,
    this.buttonType = AppButtonType.primary,
    this.isChipButton = false,
  });
  final VoidCallback onPressed;
  final String label;
  final AppButtonType buttonType;
  final IconData? icon;
  final IconData? trailingIcon;
  final String? iconPath;
  final String? trailingIconPath;
  final Color? color;
  final Color? backgroundColor;
  final bool? overrideIconColor;
  final bool? isChipButton;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (icon != null && iconPath != null) {
      throw ErrorHint(
          "Cannot set both an icon and an iconPath property simultaneously, consider removing one");
    }
    if (trailingIcon != null && trailingIconPath != null) {
      throw ErrorHint(
          "Cannot set both a trailingIcon and a trailingIconPath property simultaneously, consider removing one");
    }
    if (overrideIconColor == true && color == null) {
      throw ErrorHint(
          "Must provide a color property if overrideIconColor is set to true");
    }

    ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? theme.colorScheme.primary,
      foregroundColor: color ?? Colors.white,
    );
    Color labelColor = theme.colorScheme.primary;
    switch (buttonType) {
      case AppButtonType.primary:
        labelColor = color ?? theme.colorScheme.onPrimary;

        style = ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: kPadding24),
          fixedSize: isChipButton! ? const Size.fromHeight(42) : null,
          alignment: Alignment.center,
          backgroundColor: backgroundColor ?? theme.colorScheme.primary,
          foregroundColor: color ?? Colors.white,
        );
        break;

      case AppButtonType.secondary:
        labelColor = color ?? theme.colorScheme.onPrimaryContainer;

        style = ElevatedButton.styleFrom(
          fixedSize: isChipButton! ? const Size.fromHeight(42) : null,
          backgroundColor:
              backgroundColor ?? theme.colorScheme.primaryContainer,
          foregroundColor: labelColor,
        );
        break;

      case AppButtonType.outline:
        labelColor = color ?? theme.colorScheme.primary;

        style = ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: kPadding24),
          fixedSize: isChipButton! ? const Size.fromHeight(42) : null,
          backgroundColor: Colors.transparent,
          foregroundColor: color ?? theme.colorScheme.primary,
          side: BorderSide(
            width: 1,
            color: labelColor,
          ),
        );

        break;
      case AppButtonType.text:
        style = ElevatedButton.styleFrom(
          fixedSize: isChipButton! ? const Size.fromHeight(42) : null,
          backgroundColor: Colors.transparent,
          foregroundColor: color ?? theme.colorScheme.primary,
        );
        labelColor = color ?? theme.colorScheme.primary;
        break;

      default:
        style = ElevatedButton.styleFrom(
          fixedSize: isChipButton! ? const Size.fromHeight(42) : null,
          backgroundColor: backgroundColor ?? theme.colorScheme.primary,
          foregroundColor: color ?? Colors.white,
        );
        labelColor = color ?? theme.colorScheme.primary;
        break;
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: icon != null || iconPath != null,
              child: Row(
                children: [
                  icon != null
                      ? Icon(icon)
                      : SvgPicture.asset(iconPath ?? "",
                          colorFilter:
                              ColorFilter.mode(labelColor, BlendMode.srcIn)),
                  const Gap(kPadding8)
                ],
              ),
            ),
            Text(label,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: labelColor, fontWeight: FontWeight.w600)),
            Visibility(
              visible: trailingIcon != null || trailingIconPath != null,
              child: Row(
                children: [
                  const Gap(kPadding8),
                  trailingIcon != null
                      ? Icon(trailingIcon)
                      : SvgPicture.asset(trailingIconPath ?? "",
                          colorFilter:
                              ColorFilter.mode(labelColor, BlendMode.srcIn)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/screens/components_global/components.dart';

import '../../core/core.dart';

class ZonerChip extends StatefulWidget {
  const ZonerChip({
    super.key,
    this.onSelected,
    this.onDeleted,
    required this.label,
    this.chipType = AppChipType.filter,
    this.selectedColor,
    this.selectedBackgroundColor,
    this.icon,
    this.iconPath,
  });

  final Function(bool)? onSelected;
  final VoidCallback? onDeleted;
  final AppChipType chipType;
  final IconData? icon;
  final String? iconPath;
  final String label;
  final Color? selectedColor;
  final Color? selectedBackgroundColor;

  @override
  State<ZonerChip> createState() => _ZonerChipState();
}

class _ZonerChipState extends State<ZonerChip> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    if (widget.chipType == AppChipType.filter && widget.onSelected == null) {
      throw ErrorHint(
          "onSelected must not be null on a Filter Chip type, please consider adding the onSelected parameter");
    }
    final ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;

    return widget.chipType == AppChipType.filter
        ? FilterChip(
            side: isSelected
                ? null
                : BorderSide(
                    color: isDarkMode
                        ? ZonerColors.neutral20
                        : ZonerColors.neutral90),
            padding: EdgeInsets.only(
              top: kPadding12,
              bottom: kPadding12,
              left: (widget.icon != null || widget.iconPath != null)
                  ? kPadding8
                  : kPadding16,
              right: kPadding16,
            ),
            deleteIcon: Icon(
              FluentIcons.dismiss_24_regular,
              size: 16,
              color: isSelected ? theme.scaffoldBackgroundColor : null,
            ),
            onDeleted: widget.onDeleted,
            selectedColor:
                widget.selectedBackgroundColor ?? theme.colorScheme.primary,
            backgroundColor: theme.scaffoldBackgroundColor,
            showCheckmark:
                (widget.icon != null || widget.iconPath != null) ? false : true,
            checkmarkColor: isSelected
                ? theme.scaffoldBackgroundColor
                : theme.iconTheme.color,
            selected: isSelected,
            label: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: widget.iconPath != null || widget.icon != null,
                  child: Row(
                    children: [
                      ZonerIcon(
                        size: 16,
                        iconPath: widget.iconPath,
                        icon: widget.icon,
                        color:
                            isSelected ? theme.scaffoldBackgroundColor : null,
                      ),
                      const Gap(kPadding8),
                    ],
                  ),
                ),
                Text(
                  widget.label,
                  style: theme.textTheme.bodyMedium!.copyWith(
                      color: isSelected
                          ? theme.scaffoldBackgroundColor
                          : theme.textTheme.bodyMedium?.color),
                ),
              ],
            ),
            onSelected: (value) {
              setState(() {
                isSelected = value;
              });

              widget.onSelected!.call(value);
            })
        : Chip(
            backgroundColor:
                widget.selectedBackgroundColor ?? theme.scaffoldBackgroundColor,
            side: widget.selectedBackgroundColor == null
                ? BorderSide(
                    color: isDarkMode
                        ? ZonerColors.neutral20
                        : ZonerColors.neutral90)
                : null,
            padding: EdgeInsets.only(
              top: kPadding12,
              bottom: kPadding12,
              left: (widget.icon != null || widget.iconPath != null)
                  ? kPadding8
                  : kPadding16,
              right: kPadding16,
            ),
            label: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: widget.iconPath != null || widget.icon != null,
                  child: Row(
                    children: [
                      ZonerIcon(
                        size: 16,
                        iconPath: widget.iconPath,
                        icon: widget.icon,
                        color: widget.selectedColor,
                      ),
                      const Gap(kPadding8),
                    ],
                  ),
                ),
                Text(
                  widget.label,
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: widget.selectedColor),
                ),
              ],
            ),
          );
  }
}

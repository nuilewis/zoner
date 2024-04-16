import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../core/core.dart';

class ZonerChip extends StatefulWidget {
  const ZonerChip({
    super.key,
    this.onSelected,
    this.onDeleted,
    required this.label,
    this.chipType = AppChipType.filter,
    this.color,
    this.backgroundColor,
    this.icon,
    this.iconPath,
  });

  final Function(bool)? onSelected;
  final VoidCallback? onDeleted;
  final AppChipType chipType;
  final IconData? icon;
  final String? iconPath;
  final String label;
  final Color? color;
  final Color? backgroundColor;

  @override
  State<ZonerChip> createState() => _ZonerChipState();
}

class _ZonerChipState extends State<ZonerChip> {
  bool labelSelected = false;

  @override
  Widget build(BuildContext context) {
    if (widget.chipType == AppChipType.filter && widget.onSelected == null) {
      throw ErrorHint(
          "onSelected must not be null on a Filter Chip type, please consider adding the onSelected parameter");
    }
    final ThemeData theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;
    Color labelColor = labelSelected
        ? Colors.white
        : (!isDarkMode ? ZonerColors.neutral30 : Colors.white);

    return widget.chipType == AppChipType.filter
        ? FilterChip(
            //  padding: EdgeInsets.only(left: 4, right: labelSelected ? 4 : 8, top: , bottom: 4),
            deleteIcon: const Icon(FluentIcons.dismiss_24_regular),
            onDeleted: widget.onDeleted,
            selectedColor: theme.colorScheme.primary,
            backgroundColor:
                isDarkMode ? ZonerColors.neutral20 : ZonerColors.neutral95,
            showCheckmark: false,
            // checkmarkColor: labelColor,
            selected: labelSelected,
            label: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: widget.icon != null || widget.iconPath != null,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      widget.icon != null
                          ? Icon(widget.icon, color: labelColor, size: 20)
                          : SvgPicture.asset(widget.iconPath ?? "",
                              height: 20,
                              colorFilter: ColorFilter.mode(
                                  labelColor, BlendMode.srcIn)),
                      const Gap(8)
                    ],
                  ),
                ),
                Text(
                  widget.label,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: labelColor,
                  ),
                ),
                const Gap(8),
                Offstage(
                    offstage: !labelSelected,
                    child: Icon(FluentIcons.dismiss_24_regular,
                        color: labelColor, size: 20)),
              ],
            ),
            onSelected: (value) {
              setState(() {
                labelSelected = value;
              });

              widget.onSelected!.call(value);
            })
        : Chip(
            //side: BorderSide(width: 1, color: theme.colorScheme.primary),
            backgroundColor: widget.backgroundColor ??
                (isDarkMode ? theme.colorScheme.primary : ZonerColors.blue95),
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: widget.icon != null || widget.iconPath != null,
                  child: Row(
                    children: [
                      widget.icon != null
                          ? Icon(widget.icon, color: labelColor, size: 20)
                          : SvgPicture.asset(widget.iconPath ?? "",
                              height: 20,
                              colorFilter: ColorFilter.mode(
                                  labelColor, BlendMode.srcIn)),
                      const Gap(8)
                    ],
                  ),
                ),
                Text(
                  widget.label,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: labelColor,
                  ),
                ),
              ],
            ),
          );
  }
}

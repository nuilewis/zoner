import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';

class ZonerSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  const ZonerSearchBar({super.key, this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: ZonerInputDecoration.inputDecoration(context).copyWith(
        hintText: hintText ?? "Search",
        prefixIcon: const Icon(FluentIcons.search_24_regular),
        errorBorder: OutlineInputBorder(
          gapPadding: 4,
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.error, width: 1),
          borderRadius: BorderRadius.circular(32),
        ),
        border: OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(32),
        ),
        enabledBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(32),
        ),
        disabledBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(32),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: const BorderSide(width: 1, color: ZonerColors.purple60),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}

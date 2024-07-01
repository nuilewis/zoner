import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String? title;
  final VoidCallback? onVideoCallPressed;
  final VoidCallback? onAudioCallPressed;
  final VoidCallback? onMessagePressed;
  final bool showActions;
  final ImageProvider backgroundImage;
  final ImageProvider profileImage;
  const ProfileHeader(
      {super.key,
      required this.name,
      this.title,
      this.onVideoCallPressed,
      this.onMessagePressed,
      this.onAudioCallPressed,
      this.showActions = false,
      required this.backgroundImage,
      required this.profileImage});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Stack(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * .3,
          padding: const EdgeInsets.all(kPadding16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.cardColor,
            image: DecorationImage(image: backgroundImage, fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: kPadding32),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton.filled(
                      onPressed: () {
                        context.pop();
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: ZonerColors.purple90,
                        fixedSize: const Size.square(32),
                      ),
                      icon: const Icon(
                        FluentIcons.chevron_left_24_regular,
                        color: Colors.white,
                      ),
                    ),
                    IconButton.filled(
                      onPressed: () {
                        ///Todo: Trigger Video Call
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: ZonerColors.purple90,
                        fixedSize: const Size.square(32),
                      ),
                      icon: const Icon(
                        FluentIcons.list_rtl_20_regular,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: showActions,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton.filled(
                        onPressed: onAudioCallPressed,
                        style: IconButton.styleFrom(
                          backgroundColor: theme.colorScheme.primaryContainer,
                          fixedSize: const Size.square(48),
                        ),
                        icon: Icon(FluentIcons.call_24_regular,
                            color: theme.colorScheme.primary)),
                    const Gap(kPadding8),
                    IconButton.filled(
                      onPressed: onVideoCallPressed,
                      style: IconButton.styleFrom(
                        backgroundColor: theme.colorScheme.primaryContainer,
                        fixedSize: const Size.square(48),
                      ),
                      icon: SvgPicture.asset(
                        "assets/svg/video-camera.svg",
                        colorFilter: ColorFilter.mode(
                            theme.colorScheme.primary, BlendMode.srcIn),
                      ),
                    ),
                    const Gap(kPadding8),
                    IconButton.filled(
                      onPressed: onMessagePressed,
                      style: IconButton.styleFrom(
                        backgroundColor: theme.colorScheme.primaryContainer,
                        fixedSize: const Size.square(48),
                      ),
                      icon: Icon(
                        FluentIcons.chat_24_regular,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: kPadding16,
              right: kPadding16,
              top: MediaQuery.sizeOf(context).height * .28),
          child: Row(
            children: [
              Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: theme.scaffoldBackgroundColor, width: 6),
                      shape: BoxShape.circle,
                      image: DecorationImage(image: profileImage))),
              const Gap(kPadding12),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: theme.textTheme.titleLarge,
                  ),
                  Visibility(
                    visible: title != null,
                    child: Column(
                      children: [
                        const Gap(kPadding4),
                        Text(
                          title ?? "",
                          style: theme.textTheme.bodyMedium!
                              .copyWith(color: ZonerColors.neutral50),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

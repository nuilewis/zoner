import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:zoner/core/constants.dart';
import 'package:zoner/screens/global/messages/components/message_form_field.dart';

import 'components/message_bubbles.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding16),
        child: Column(
          children: [
            const Gap(kPadding64),
            Row(
              children: [
                IconButton.filled(
                    style: IconButton.styleFrom(
                        backgroundColor: isDarkMode
                            ? ZonerColors.neutral20
                            : ZonerColors.neutral95),
                    onPressed: () {},
                    icon: const Icon(FluentIcons.chevron_left_24_regular)),
                const Spacer(),
                IconButton.filled(
                    style: IconButton.styleFrom(
                        backgroundColor: isDarkMode
                            ? ZonerColors.neutral20
                            : ZonerColors.neutral95),
                    onPressed: () {},
                    icon: const Icon(FluentIcons.video_24_regular)),
                IconButton.filled(
                    style: IconButton.styleFrom(
                        backgroundColor: isDarkMode
                            ? ZonerColors.neutral20
                            : ZonerColors.neutral95),
                    onPressed: () {},
                    icon: const Icon(FluentIcons.call_24_regular)),
                IconButton.filled(
                    style: IconButton.styleFrom(
                        backgroundColor: isDarkMode
                            ? ZonerColors.neutral20
                            : ZonerColors.neutral95),
                    onPressed: () {},
                    icon: const Icon(FluentIcons.list_rtl_20_regular)),
              ],
            ),
            const Gap(kPadding8),
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/memoji.jpg"),
                  radius: 32,
                ),
                const Gap(kPadding12),
                Text("Dr Lucy Lu", style: theme.textTheme.titleMedium),
              ],
            ),
            const Gap(kPadding24),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList.builder(
                    itemBuilder: (context, index) => const TextMessageBubble(
                      replyingMessage: "Replied to this message",
                      message: 'Yorem ipsum dolflyfljfkdnfgxmhfxhcxs',
                    ),
                    itemCount: 3,
                  )
                ],
              ),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList.builder(
                    itemBuilder: (context, index) => const ImageMessageBubble(
                        // isReceived: false,
                        // replyingMessage: "Replied to this message",
                        imageUrl: "assets/images/image.jpg"),
                    itemCount: 1,
                  )
                ],
              ),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList.builder(
                    itemBuilder: (context, index) => const AudioMessageBubble(
                      replyingMessage: "dphsjh",
                      isReceived: false,
                    ),
                    itemCount: 1,
                  )
                ],
              ),
            ),
            const MessageFormField(),
            const Gap(kPadding24),
          ],
        ),
      ),
    );
  }
}

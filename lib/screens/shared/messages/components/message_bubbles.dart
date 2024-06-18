import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

import '../../../../core/core.dart';

enum MessagePosition { start, middle, end, single }

///Text Message Bubble
class TextMessageBubble extends StatelessWidget {
  final bool? isReceived;
  final MessagePosition? messagePosition;
  final String message;
  final String? replyingMessage;
  const TextMessageBubble(
      {super.key,
      this.isReceived = true,
      this.messagePosition = MessagePosition.start,
      required this.message,
      this.replyingMessage});

  @override
  Widget build(BuildContext context) {
    BorderRadius messageBorderRadius = BorderRadius.circular(kPadding16);
    BorderRadius replyMessageBorderRadius = BorderRadius.circular(kPadding16);
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;
    final double maxBubbleWidth =
        _determineMessageBubbleWidth(context, message);

    switch (messagePosition) {
      case MessagePosition.middle:
        messageBorderRadius = BorderRadius.only(
            topLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomRight: Radius.circular(isReceived! ? kPadding16 : kPadding4),
            topRight: Radius.circular(isReceived! ? kPadding16 : kPadding4));

      case MessagePosition.start:
        messageBorderRadius = BorderRadius.only(
            topLeft: const Radius.circular(kPadding16),
            bottomLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomRight: Radius.circular(isReceived! ? kPadding16 : kPadding4),
            topRight: const Radius.circular(kPadding16));
      case MessagePosition.end:
        messageBorderRadius = BorderRadius.only(
            topLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomLeft: const Radius.circular(kPadding16),
            bottomRight: const Radius.circular(kPadding16),
            topRight: Radius.circular(isReceived! ? kPadding16 : kPadding4));

      default:
        messageBorderRadius = BorderRadius.only(
            topLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomLeft: const Radius.circular(kPadding16),
            bottomRight: const Radius.circular(kPadding16),
            topRight: Radius.circular(isReceived! ? kPadding16 : kPadding4));
    }

    switch (messagePosition) {
      case MessagePosition.start:
        replyMessageBorderRadius = const BorderRadius.only(
            topRight: Radius.circular(kPadding12),
            topLeft: Radius.circular(kPadding12),
            bottomRight: Radius.circular(kPadding4),
            bottomLeft: Radius.circular(kPadding4));
      default:
        replyMessageBorderRadius = BorderRadius.only(
            topRight: Radius.circular(isReceived! ? kPadding12 : kPadding4),
            topLeft: Radius.circular(isReceived! ? kPadding4 : kPadding12),
            bottomRight: const Radius.circular(kPadding4),
            bottomLeft: const Radius.circular(kPadding4));
    }

    return Align(
      alignment: isReceived! ? Alignment.centerLeft : Alignment.centerRight,
      child: AnimatedContainer(
        constraints: BoxConstraints(maxWidth: maxBubbleWidth),
        duration: 200.ms,
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(kPadding4),
        margin: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
            color: isReceived!
                ? (isDarkMode ? ZonerColors.neutral20 : ZonerColors.neutral95)
                : theme.colorScheme.primaryContainer,

            ///Might make this primary
            borderRadius: messageBorderRadius),
        child: replyingMessage != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: maxBubbleWidth,
                    padding: const EdgeInsets.symmetric(
                        vertical: kPadding8, horizontal: kPadding12),
                    decoration: BoxDecoration(
                        color: theme.scaffoldBackgroundColor,
                        borderRadius: replyMessageBorderRadius),
                    child: Text(
                      replyingMessage ?? "",
                      style: theme.textTheme.bodySmall!
                          .copyWith(color: ZonerColors.neutral50),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kPadding4, horizontal: kPadding8),
                    child: Text(
                      message,
                    ),
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: kPadding8, horizontal: kPadding12),
                child: Text(
                  message,
                ),
              ),
      ),
    );
  }

  ///Get Label Size

  double _determineMessageBubbleWidth(BuildContext context, String message) {
    ///Goes through the list of labels and returns the maximum size (width) of
    ///all the label elements, which would be used to determine the size of the
    ///painter that draws the Label ListWheelScrollView
    Size currentSize;
    double maxWidth = MediaQuery.sizeOf(context).width * .8;

    final TextSpan textSpan =
        TextSpan(text: message, style: Theme.of(context).textTheme.bodyMedium);
    final TextPainter textPainter =
        TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    textPainter.layout();
    currentSize = textPainter.size;

    if (currentSize.width < maxWidth) {
      maxWidth = currentSize.width;
    }

    return maxWidth;
  }
}

///Image Message Bubble
class ImageMessageBubble extends StatelessWidget {
  final bool? isReceived;
  final MessagePosition? messagePosition;
  final String imageUrl;
  final String? replyingMessage;
  const ImageMessageBubble(
      {super.key,
      this.isReceived = true,
      this.messagePosition = MessagePosition.start,
      required this.imageUrl,
      this.replyingMessage});

  @override
  Widget build(BuildContext context) {
    BorderRadius messageBorderRadius = BorderRadius.circular(kPadding16);
    BorderRadius replyMessageBorderRadius = BorderRadius.circular(kPadding16);
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    switch (messagePosition) {
      case MessagePosition.middle:
        messageBorderRadius = BorderRadius.only(
            topLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomRight: Radius.circular(isReceived! ? kPadding16 : kPadding4),
            topRight: Radius.circular(isReceived! ? kPadding16 : kPadding4));

      case MessagePosition.start:
        messageBorderRadius = BorderRadius.only(
            topLeft: const Radius.circular(kPadding16),
            bottomLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomRight: Radius.circular(isReceived! ? kPadding16 : kPadding4),
            topRight: const Radius.circular(kPadding16));
      case MessagePosition.end:
        messageBorderRadius = BorderRadius.only(
            topLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomLeft: const Radius.circular(kPadding16),
            bottomRight: const Radius.circular(kPadding16),
            topRight: Radius.circular(isReceived! ? kPadding16 : kPadding4));

      default:
        messageBorderRadius = BorderRadius.only(
            topLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomLeft: const Radius.circular(kPadding16),
            bottomRight: const Radius.circular(kPadding16),
            topRight: Radius.circular(isReceived! ? kPadding16 : kPadding4));
    }

    switch (messagePosition) {
      case MessagePosition.start:
        replyMessageBorderRadius = const BorderRadius.only(
            topRight: Radius.circular(kPadding16),
            topLeft: Radius.circular(kPadding16),
            bottomRight: Radius.circular(kPadding4),
            bottomLeft: Radius.circular(kPadding4));
      default:
        replyMessageBorderRadius = BorderRadius.only(
            topRight: Radius.circular(isReceived! ? kPadding16 : kPadding4),
            topLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomRight: const Radius.circular(kPadding4),
            bottomLeft: const Radius.circular(kPadding4));
    }

    return Align(
      alignment: isReceived! ? Alignment.centerLeft : Alignment.centerRight,
      child: AnimatedContainer(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * .6),
        duration: 200.ms,
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
            color: isReceived!
                ? (isDarkMode ? ZonerColors.neutral20 : ZonerColors.neutral95)
                : theme.colorScheme.primary,

            ///Might make this primary
            borderRadius: messageBorderRadius),
        child: replyingMessage != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * .6,
                    padding: const EdgeInsets.symmetric(
                        vertical: kPadding8, horizontal: kPadding12),
                    decoration: BoxDecoration(
                        color: theme.scaffoldBackgroundColor,
                        borderRadius: replyMessageBorderRadius),
                    child: Text(
                      replyingMessage ?? "",
                      style: theme.textTheme.bodySmall!
                          .copyWith(color: ZonerColors.neutral50),
                    ),
                  ),
                  const Gap(2),
                  ClipRRect(
                    borderRadius: messageBorderRadius.copyWith(
                        topLeft: const Radius.circular(kPadding4),
                        topRight: const Radius.circular(kPadding4)),
                    child: Image(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: ClipRRect(
                  borderRadius: messageBorderRadius,
                  child: Image(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
      ),
    );
  }
}

///Audio Message Bubble
class AudioMessageBubble extends StatelessWidget {
  final bool? isReceived;
  final MessagePosition? messagePosition;
  //Todo: add parameter for audio file
  final String? replyingMessage;
  const AudioMessageBubble(
      {super.key,
      this.isReceived = true,
      this.messagePosition = MessagePosition.start,
      this.replyingMessage});

  @override
  Widget build(BuildContext context) {
    BorderRadius messageBorderRadius = BorderRadius.circular(kPadding16);
    BorderRadius replyMessageBorderRadius = BorderRadius.circular(kPadding16);
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    switch (messagePosition) {
      case MessagePosition.middle:
        messageBorderRadius = BorderRadius.only(
            topLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomRight: Radius.circular(isReceived! ? kPadding16 : kPadding4),
            topRight: Radius.circular(isReceived! ? kPadding16 : kPadding4));

      case MessagePosition.start:
        messageBorderRadius = BorderRadius.only(
            topLeft: const Radius.circular(kPadding16),
            bottomLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomRight: Radius.circular(isReceived! ? kPadding16 : kPadding4),
            topRight: const Radius.circular(kPadding16));
      case MessagePosition.end:
        messageBorderRadius = BorderRadius.only(
            topLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomLeft: const Radius.circular(kPadding16),
            bottomRight: const Radius.circular(kPadding16),
            topRight: Radius.circular(isReceived! ? kPadding16 : kPadding4));

      default:
        messageBorderRadius = BorderRadius.only(
            topLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomLeft: const Radius.circular(kPadding16),
            bottomRight: const Radius.circular(kPadding16),
            topRight: Radius.circular(isReceived! ? kPadding16 : kPadding4));
    }

    switch (messagePosition) {
      case MessagePosition.start:
        replyMessageBorderRadius = const BorderRadius.only(
            topRight: Radius.circular(kPadding16),
            topLeft: Radius.circular(kPadding16),
            bottomRight: Radius.circular(kPadding4),
            bottomLeft: Radius.circular(kPadding4));
      default:
        replyMessageBorderRadius = BorderRadius.only(
            topRight: Radius.circular(isReceived! ? kPadding16 : kPadding4),
            topLeft: Radius.circular(isReceived! ? kPadding4 : kPadding16),
            bottomRight: const Radius.circular(kPadding4),
            bottomLeft: const Radius.circular(kPadding4));
    }

    return Align(
      alignment: isReceived! ? Alignment.centerLeft : Alignment.centerRight,
      child: AnimatedContainer(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * .8),
        duration: 200.ms,
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
            color: isReceived!
                ? (isDarkMode ? ZonerColors.neutral20 : ZonerColors.neutral95)
                : theme.colorScheme.primaryContainer,

            ///Might make this primary
            borderRadius: messageBorderRadius),
        child: replyingMessage != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * .8,
                    padding: const EdgeInsets.symmetric(
                        vertical: kPadding8, horizontal: kPadding12),
                    decoration: BoxDecoration(
                        color: theme.scaffoldBackgroundColor,
                        borderRadius: replyMessageBorderRadius),
                    child: Text(replyingMessage ?? "",
                        style: theme.textTheme.bodySmall),
                  ),
                  const Gap(2),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: kPadding4),
                    child: Row(
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            style: IconButton.styleFrom(
                                visualDensity: VisualDensity.compact),
                            onPressed: () {},
                            icon: Icon(
                              FluentIcons.play_16_regular,
                              size: 20,
                              color: theme.colorScheme.primary,
                            )),
                        Expanded(
                          child: Slider(
                            value: 0.5,
                            onChanged: (value) {},
                            activeColor: theme.colorScheme.primary,
                            inactiveColor: theme.cardColor,
                          ),
                        ),
                        Text(
                          '00:23',
                          style: theme.textTheme.bodySmall,
                        ),
                        const Gap(kPadding12)
                      ],
                    ),
                  ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: kPadding4),
                child: Row(
                  children: [
                    IconButton(
                        padding: EdgeInsets.zero,
                        style: IconButton.styleFrom(
                            visualDensity: VisualDensity.compact),
                        onPressed: () {},
                        icon: Icon(
                          FluentIcons.play_16_regular,
                          size: 20,
                          color: theme.colorScheme.primary,
                        )),
                    Expanded(
                      child: Slider(
                        value: 0.5,
                        onChanged: (value) {},
                        activeColor: theme.colorScheme.primary,
                        inactiveColor: theme.colorScheme.primaryContainer,
                      ),
                    ),
                    Text('00:23', style: theme.textTheme.bodySmall),
                    const Gap(kPadding12)
                  ],
                ),
              ),
      ),
    );
  }
}

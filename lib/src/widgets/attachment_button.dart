import 'package:flutter/material.dart';

import 'inherited_chat_theme.dart';
import 'inherited_l10n.dart';

/// A class that represents attachment button widget
class AttachmentButton extends StatelessWidget {
  /// Creates attachment button widget
  const AttachmentButton({
    Key? key,
    this.isLoading = false,
    this.onPressed,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  /// Show a loading spinner instead of the icon
  final bool isLoading;

  /// Callback for attachment button tap event
  final void Function()? onPressed;

  /// Padding around the icon button
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => IconButton(
        splashRadius: 24,
        constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
        icon: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                  strokeWidth: 1.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    InheritedChatTheme.of(context).theme.inputTextColor,
                  ),
                ),
              )
            : InheritedChatTheme.of(context).theme.attachmentButtonIcon ??
                Image.asset(
                  'assets/icon-attachment.png',
                  color: InheritedChatTheme.of(context).theme.inputTextColor,
                  package: 'flutter_chat_ui',
                ),
        onPressed: isLoading ? null : onPressed,
        padding: padding,
        tooltip:
            InheritedL10n.of(context).l10n.attachmentButtonAccessibilityLabel,
      );
}

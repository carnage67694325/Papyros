import 'package:flutter/material.dart';

class MessageInputField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final VoidCallback? onSendPressed;
  final VoidCallback? onCameraPressed;
  final VoidCallback? onAttachmentPressed;
  final String hintText;
  final Color? backgroundColor;
  final Color? sendButtonColor;
  final EdgeInsets contentPadding;

  const MessageInputField({
    super.key,
    this.controller,
    this.focusNode,
    this.onSendPressed,
    this.onCameraPressed,
    this.onAttachmentPressed,
    this.hintText = 'Message ....',
    this.backgroundColor = Colors.white,
    this.sendButtonColor,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final actualSendButtonColor = sendButtonColor ?? theme.primaryColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 3.0,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      focusNode: focusNode,
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                        ),
                        border: InputBorder.none,
                        contentPadding: contentPadding,
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.multiline,
                      maxLines: 1,
                      minLines: 1,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => onSendPressed?.call(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.camera_alt_outlined),
                    color: Colors.grey[400],
                    onPressed: onCameraPressed,
                    constraints: const BoxConstraints(maxWidth: 40),
                    visualDensity: VisualDensity.compact,
                    splashRadius: 20,
                  ),
                  IconButton(
                    icon: const Icon(Icons.attach_file),
                    color: Colors.grey[400],
                    onPressed: onAttachmentPressed,
                    constraints: const BoxConstraints(maxWidth: 40),
                    visualDensity: VisualDensity.compact,
                    splashRadius: 20,
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Container(
            width: 46.0,
            height: 46.0,
            decoration: BoxDecoration(
              color: actualSendButtonColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              color: Colors.white,
              onPressed: onSendPressed,
            ),
          ),
        ],
      ),
    );
  }
}

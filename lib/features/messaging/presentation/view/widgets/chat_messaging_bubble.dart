import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';

class ChatMessagingBubble extends StatefulWidget {
  final String message;
  final bool? isSender;

  const ChatMessagingBubble({
    super.key,
    required this.message,
    this.isSender,
  });

  @override
  State<ChatMessagingBubble> createState() => _ChatMessagingBubbleState();
}

class _ChatMessagingBubbleState extends State<ChatMessagingBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller with a short duration
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));

    // Create a scale animation that starts small and pops to normal size
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack, // Use easeOutBack for a nice "pop" effect
    );

    // Start the animation when the widget is built
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: BubbleSpecialOne(
        text: widget.message,
        color: AppColors.lightPeach,
        isSender: widget.isSender ?? true,
      ),
    );
  }
}

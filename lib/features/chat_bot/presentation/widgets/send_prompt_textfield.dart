import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';

class SendPromptTextfield extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const SendPromptTextfield({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.textfieldBackGroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(140),
            blurRadius: 30,
            spreadRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'your message here .......',
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 9),
          GestureDetector(
            onTap: onSend,
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: AppColors.lightPeach,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.send,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

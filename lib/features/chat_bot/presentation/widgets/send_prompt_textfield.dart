import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            style: const TextStyle(
              color: Colors.black,
            ),
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
            height: 40.h,
            width: 40.w,
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
    );
  }
}

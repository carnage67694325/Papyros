import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';

class SendPromptTextfield extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onPickFromGallery;
  final VoidCallback onPickFromCamera;

  const SendPromptTextfield({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onPickFromGallery,
    required this.onPickFromCamera,
  });

  void _showPickImageOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Pick from Camera"),
                onTap: () {
                  Navigator.pop(context);
                  onPickFromCamera();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Pick from Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  onPickFromGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => _showPickImageOptions(context),
          child: Container(
            height: 40.h,
            width: 40.w,
            margin: EdgeInsets.only(right: 6.w),
            decoration: const BoxDecoration(
              color: AppColors.lightPeach,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.image,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        Expanded(
          child: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'your message here .......',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
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

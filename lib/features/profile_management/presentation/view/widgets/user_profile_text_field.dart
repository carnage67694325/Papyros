import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';

class UserProfileTexField extends StatelessWidget {
  const UserProfileTexField({
    super.key,
    required this.lableText,
    required this.hintText,
    required this.onChanged,
    required this.initialValue,
  });

  final String lableText;
  final String hintText;
  final void Function(String) onChanged;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        TextEditingController(text: initialValue);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(8),
        child: TextField(
          controller: controller, // Use the controller here
          onChanged: onChanged,
          maxLines: 1,
          decoration: InputDecoration(
            labelText: lableText,
            labelStyle: const TextStyle(
              color: AppColors.lightBrown,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(),
            contentPadding: const EdgeInsets.all(20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

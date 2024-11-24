import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';

class UserProfileTextFormField extends StatelessWidget {
  const UserProfileTextFormField(
      {super.key,
      required this.lableText,
      required this.hintText,
      required this.onSubmitted});
  final String lableText;
  final String hintText;
  final void Function(String) onSubmitted;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(8),
        child: TextField(
          onSubmitted: onSubmitted,
          maxLines: 1,
          decoration: InputDecoration(
            labelText: lableText,
            labelStyle: const TextStyle(
              color: AppColors.lightBrown, // Set the label color to grey
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColors.lightBrown, // Set the hint text color to grey
            ),
            contentPadding: const EdgeInsets.all(20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.grey, // Set the border color to grey
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.grey,
                // Set the border color to grey
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Colors.grey,
                // Set the border color to grey
              ),
            ),
          ),
        ),
      ),
    );
  }
}

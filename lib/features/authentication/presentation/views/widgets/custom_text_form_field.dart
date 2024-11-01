import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.obscureText,
    this.suffixIcon,
    this.controller,
    this.onChanged,
  });
  final String hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      validator: (value) {
        if (value!.isEmpty) {
          return 'field is required';
        }
      },
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textFieldFillColor.withOpacity(0.7),
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/main.dart';

class GenderSelectionTextFormField extends StatefulWidget {
  final String hintText;
  final Function(String)? onChanged;

  const GenderSelectionTextFormField({
    super.key,
    required this.hintText,
    this.onChanged,
  });

  @override
  _GenderSelectionTextFormFieldState createState() =>
      _GenderSelectionTextFormFieldState();
}

class _GenderSelectionTextFormFieldState
    extends State<GenderSelectionTextFormField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      controller: _controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'field is required';
        }
      },
      readOnly: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textFieldFillColor.withOpacity(0.7),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        hintText: widget.hintText,
        prefixIcon: Padding(
          padding: isArabic()
              ? const EdgeInsets.only(right: 16, left: 10, top: 16, bottom: 16)
              : const EdgeInsets.only(left: 16, right: 10, top: 16, bottom: 16),
          child: const Icon(Icons.person),
        ),
      ),
      onTap: () async {
        // Show the gender selection dialog
        await _showGenderSelectionDialog();
      },
    );
  }

  Future<void> _showGenderSelectionDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Gender'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Female selection button
              GestureDetector(
                onTap: () {
                  _controller.text = 'female';
                  widget.onChanged?.call('female'); // Notify parent widget
                  Navigator.of(context).pop();
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.female, size: 48, color: Colors.pink),
                    Text('female'),
                  ],
                ),
              ),
              // Male selection button
              GestureDetector(
                onTap: () {
                  _controller.text = 'male';
                  widget.onChanged?.call('male'); // Notify parent widget
                  Navigator.of(context).pop();
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.male, size: 48, color: Colors.blue),
                    Text('male'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';

class GenderDropdown extends StatefulWidget {
  const GenderDropdown({super.key, required this.initialValue});
  final String initialValue;

  @override
  _GenderDropdownState createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  String? selectedGender;
  @override
  void initState() {
    super.initState();

    selectedGender = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Material(
          elevation: 20,
          borderRadius: BorderRadius.circular(12),
          child: DropdownButtonFormField<String>(
            value: selectedGender,
            decoration: InputDecoration(
              labelText: 'Gender',
              labelStyle: const TextStyle(
                color: AppColors.lightBrown, // Set the label color to grey
              ),
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
            items: [
              'male',
              'female',
              'Prefer not to say',
            ].map((gender) {
              return DropdownMenuItem<String>(
                value: gender,
                child: Text(gender),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedGender = value; // Update the selected value
              });
            },
            onSaved: (value) {
              log('Selected Gender: $value'); // Save or process the value
            },
          ),
        ),
      ),
    );
  }
}

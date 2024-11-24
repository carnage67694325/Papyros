import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';

class GenderDropdown extends StatefulWidget {
  const GenderDropdown({super.key});

  @override
  _GenderDropdownState createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  String? selectedGender; // Holds the selected value

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Material(
          elevation: 20,
          borderRadius: BorderRadius.circular(8),
          child: DropdownButtonFormField<String>(
            value: selectedGender,
            decoration: InputDecoration(
              labelText: 'Gender',
              labelStyle: const TextStyle(
                color: AppColors.lightBrown, // Set the label color to grey
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            items: [
              'Male',
              'Female',
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

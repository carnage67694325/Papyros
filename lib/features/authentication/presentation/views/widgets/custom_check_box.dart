import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: true,
        fillColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            // Customize the color based on the state of the checkbox
            if (states.contains(WidgetState.selected)) {
              return AppColors.mediumBrown; // Color when checkbox is selected
            }
            return Colors.white; // Color when checkbox is unselected
          },
        ),
        onChanged: (bool? value) {
          value = true;
        });
  }
}

import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/generated/l10n.dart';

class RememberMeSection extends StatelessWidget {
  const RememberMeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Row(
        children: [
          Checkbox(
              value: true,
              fillColor: WidgetStateProperty.resolveWith<Color>(
                (Set<WidgetState> states) {
                  // Customize the color based on the state of the checkbox
                  if (states.contains(WidgetState.selected)) {
                    return AppColors
                        .mediumBrown; // Color when checkbox is selected
                  }
                  return Colors.white; // Color when checkbox is unselected
                },
              ),
              onChanged: (bool? value) {
                value = true;
              }),
          const SizedBox(
            width: 4,
          ),
          Text(
            S.of(context).rememberMe,
            style: AppStyles.textfieldHint.copyWith(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

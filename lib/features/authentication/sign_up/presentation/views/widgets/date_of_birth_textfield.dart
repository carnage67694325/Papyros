import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/main.dart';

class DateOfBirthTextFormField extends StatefulWidget {
  final String hintText;
  final Function(String)? onChanged;

  const DateOfBirthTextFormField({
    super.key,
    required this.hintText,
    this.onChanged,
  });

  @override
  _DateOfBirthTextFormFieldState createState() =>
      _DateOfBirthTextFormFieldState();
}

class _DateOfBirthTextFormFieldState extends State<DateOfBirthTextFormField> {
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
        return null;
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
              ? EdgeInsets.only(
                  right: 16.w, left: 10.w, top: 16.h, bottom: 16.h)
              : EdgeInsets.only(
                  left: 16.w, right: 10.w, top: 16.h, bottom: 16.h),
          child: const Icon(
            Icons.calendar_today,
            color: AppColors.iconColor,
          ),
        ),
      ),
      onTap: () async {
        // Show the date picker
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        // If a date is picked, format it and set it to the TextFormField
        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          _controller.text = formattedDate;
          widget.onChanged?.call(formattedDate); // Notify the parent widget
        }
      },
    );
  }
}

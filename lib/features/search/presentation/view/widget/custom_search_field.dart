import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:searchfield/searchfield.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: SearchField(
        searchInputDecoration: SearchInputDecoration(
          fillColor: AppColors.lightGreyBlue.withAlpha(75),
          filled: true,
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: 16.sp,
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColors.lightPeach),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColors.lightPeach),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
        suggestions: [
          SearchFieldListItem<String>('Ancient Egypt'),
          SearchFieldListItem<String>('Pharaohs'),
          SearchFieldListItem<String>('Pyramids of Giza'),
          SearchFieldListItem<String>('Tutankhamun'),
          SearchFieldListItem<String>('Cleopatra'),
          SearchFieldListItem<String>('Hieroglyphics'),
          SearchFieldListItem<String>('Nefertiti'),
          SearchFieldListItem<String>('Valley of the Kings'),
          SearchFieldListItem<String>('Rosetta Stone'),
          SearchFieldListItem<String>('Old Kingdom'),
          SearchFieldListItem<String>('Middle Kingdom'),
          SearchFieldListItem<String>('New Kingdom'),
          SearchFieldListItem<String>('Temple of Karnak'),
          SearchFieldListItem<String>('Abu Simbel Temples'),
          SearchFieldListItem<String>('Egyptian Mythology'),
        ],
      ),
    );
  }
}

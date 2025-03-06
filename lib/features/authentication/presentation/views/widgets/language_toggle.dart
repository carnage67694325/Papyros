import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/manager/locale_cubit/change_local_cubit.dart';

class LanguageToggle extends StatefulWidget {
  const LanguageToggle({
    super.key,
  });

  @override
  _LanguageToggleState createState() => _LanguageToggleState();
}

class _LanguageToggleState extends State<LanguageToggle> {
  bool isEnglishSelected = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isEnglishSelected = !isEnglishSelected;
          BlocProvider.of<ChangeLocalCubit>(context)
              .changeLocal(isEnglishSelected);
        });
      },
      child: Padding(
        padding: EdgeInsets.only(right: 230.w),
        child: Container(
          width: 120.w,
          height: 40.h,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.lightPeach, // Background color of the toggle
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                alignment: isEnglishSelected
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Container(
                  width: 55.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: Colors.white, // Color of the selected option
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        !isEnglishSelected ? "ُEnglish" : "ُالعربية",
                        style: TextStyle(
                          color: isEnglishSelected
                              ? Colors.black
                              : AppColors.mediumBrown,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        isEnglishSelected ? "الانجليزية" : " Arabic",
                        style: TextStyle(
                          color: isEnglishSelected
                              ? AppColors.mediumBrown
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

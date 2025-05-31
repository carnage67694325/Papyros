import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/manager/theme_cubit/cubit/theme_cubit.dart';
// Import your theme cubit here
// import 'package:papyros/core/utils/manager/theme_cubit/theme_cubit.dart';

class ThemeToggle extends StatefulWidget {
  const ThemeToggle({
    super.key,
  });

  @override
  _ThemeToggleState createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  bool isDarkSelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ThemeCubit, ThemeState>(
      listener: (context, state) {
        if (state is ThemeChanged) {
          setState(() {
            isDarkSelected = state.isDarkMode;
          });
        }
      },
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<ThemeCubit>(context).toggleTheme();
        },
        child: Padding(
          padding: EdgeInsets.only(right: 230.w),
          child: Container(
            width: 120.w,
            height: 40.h,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isDarkSelected
                  ? Colors.grey[800]
                  : AppColors.lightPeach, // Background changes based on theme
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  alignment: isDarkSelected
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    width: 55.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: isDarkSelected
                          ? Colors.grey[700]
                          : Colors.white, // Slider color changes
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Center(
                        child: Icon(
                          Icons.light_mode,
                          color: isDarkSelected
                              ? Colors.grey[400]
                              : AppColors.mediumBrown,
                          size: 18.sp,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Icon(
                          Icons.dark_mode,
                          color:
                              isDarkSelected ? Colors.white : Colors.grey[400],
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

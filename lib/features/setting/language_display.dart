import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/language_toggle.dart';

class LanguageDisplay extends StatelessWidget {
  const LanguageDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Language and display",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Column(
          children: [
            SizedBox(
              height: 12.h,
            ),
            Text(
              "Language",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Divider(indent: 16.w, endIndent: 16.w, height: 0.h),
            SizedBox(
              height: 12.h,
            ),
            const LanguageToggle(),
            SizedBox(
              height: 24.h,
            ),
            Text(
              "Display",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Divider(indent: 16.w, endIndent: 16.w, height: 0.h),
          ],
        ),
      ),
    );
  }
}

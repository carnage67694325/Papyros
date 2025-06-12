import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle logo = GoogleFonts.sonsieOne(
    fontSize: 32.sp,
    color: Colors.white,
    fontWeight: FontWeight.normal,
  );
  static TextStyle header = GoogleFonts.notoSansSymbols(
    fontSize: 32.sp,
    fontWeight: FontWeight.normal,
  );
  static TextStyle subHeader = GoogleFonts.notoSansSymbols(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: Colors.black.withOpacity(0.53),
  );
  static TextStyle textfieldHint = GoogleFonts.notoSansSymbols(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
  );
  static TextStyle chatHeader = GoogleFonts.inter(
    fontSize: 24.sp,
    color: Colors.black.withValues(
      alpha: 0.75,
    ),
    fontWeight: FontWeight.bold,
  );
  static TextStyle postContent = GoogleFonts.inter(
    fontSize: 16.sp,
    color: Colors.black.withValues(
      alpha: 0.75,
    ),
    fontWeight: FontWeight.normal,
  );
}

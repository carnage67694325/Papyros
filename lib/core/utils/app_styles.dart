import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

 class AppStyles {
  static TextStyle logo = GoogleFonts.sonsieOne(
    fontSize: 32,
    color: Colors.white,
    fontWeight: FontWeight.normal,
  );
  static TextStyle header = GoogleFonts.notoSansSymbols(
    fontSize: 32,
    fontWeight: FontWeight.normal,
  );
  static TextStyle subHeader = GoogleFonts.notoSansSymbols(
    fontSize: 32,
    fontWeight: FontWeight.normal,
    color: Colors.black.withOpacity(0.53),
  );
  static TextStyle textfieldHint = GoogleFonts.notoSansSymbols(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
}

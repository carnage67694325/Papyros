import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  TextStyle logo = GoogleFonts.sonsieOne(
    fontSize: 32,
    fontWeight: FontWeight.normal,
  );
  TextStyle header = GoogleFonts.notoSansSymbols(
    fontSize: 32,
    fontWeight: FontWeight.normal,
  );
  TextStyle subHeader = GoogleFonts.notoSansSymbols(
    fontSize: 32,
    fontWeight: FontWeight.normal,
    color: Colors.black.withOpacity(0.53),
  );
  TextStyle textfieldHint = GoogleFonts.notoSansSymbols(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
}

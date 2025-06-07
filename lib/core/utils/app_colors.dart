import 'package:flutter/material.dart';

abstract class AppColors {
  // Light mode colors
  static const Color primaryBlue = Color(0xFF6482AD);
  static const Color lightBlue = Color(0xFF7FA1C3);
  static const Color lightGreyBlue = Color(0xFFE2DAD6);
  static const Color darkBrown = Color(0xFF584242);
  static const Color lightPeach = Color(0xFFD4AB9A);
  static const Color lightBrown = Color(0xFFC19C8D);
  static const Color mediumBrown = Color(0xFF896252);
  static const Color lightYellow = Color(0xFFF6EFBD);
  static const Color textFieldFillColor = Color(0xFFE8E8E8);
  static const Color backGroundColor = Color(0xFFF9F6F6);
  static const Color iconColor = Color(0xff8A878C);
  static const Color textfieldBackGroundColor = Color(0xFFECECEC);

  // Dark mode colors
  static const Color darkPrimaryBlue = Color(0xFF4A6190);
  static const Color darkLightBlue = Color(0xFF5A7FA8);
  static const Color darkGreyBlue = Color(0xFF2A2625);
  static const Color darkDarkBrown = Color(0xFF3A2E2E);
  static const Color darkLightPeach = Color(0xFF8B6B5A);
  static const Color darkLightBrown = Color(0xFF7A6458);
  static const Color darkMediumBrown = Color(0xFF5C4238);
  static const Color darkLightYellow = Color(0xFF3A3526);
  static const Color darkTextFieldFillColor = Color(0xFF2A2A2A);
  static const Color darkBackGroundColor = Color.fromARGB(255, 0, 0, 0);
  static const Color darkIconColor = Color(0xFFB5B2B7);
  static const Color darkTextfieldBackGroundColor = Color(0xFF242424);

  // Adaptive color getters
  static Color getPrimaryBlue(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkPrimaryBlue
        : primaryBlue;
  }

  static Color getLightBlue(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkLightBlue
        : lightBlue;
  }

  static Color getLightGreyBlue(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkGreyBlue
        : lightGreyBlue;
  }

  static Color getDarkBrown(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkDarkBrown
        : darkBrown;
  }

  static Color getLightPeach(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkLightPeach
        : lightPeach;
  }

  static Color getLightBrown(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkLightBrown
        : lightBrown;
  }

  static Color getMediumBrown(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkMediumBrown
        : mediumBrown;
  }

  static Color getLightYellow(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkLightYellow
        : lightYellow;
  }

  static Color getTextFieldFillColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkTextFieldFillColor
        : textFieldFillColor;
  }

  static Color getBackGroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBackGroundColor
        : backGroundColor;
  }

  static Color getIconColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkIconColor
        : iconColor;
  }

  static Color getTextfieldBackGroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkTextfieldBackGroundColor
        : textfieldBackGroundColor;
  }

  // Adaptive gradient
  static LinearGradient buildLinearGradient(BuildContext context) {
    return LinearGradient(
      colors: Theme.of(context).brightness == Brightness.dark
          ? [darkLightPeach, darkMediumBrown]
          : [lightPeach, mediumBrown],
      begin: AlignmentDirectional.topStart,
      end: Alignment.bottomCenter,
    );
  }
}

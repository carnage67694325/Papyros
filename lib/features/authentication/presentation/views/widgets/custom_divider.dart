import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color(0xFFE8E8E8),
      height: 30,
      indent: 45,
      endIndent: 45,
    );
  }
}

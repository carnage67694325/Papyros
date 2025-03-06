import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_divider.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.headerText,
    required this.subHeaderText,
  });
  final String headerText;
  final String subHeaderText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          headerText,
          style: AppStyles.header,
        ),
        SizedBox(height: 10.h),
        Text(
          subHeaderText,
          style: AppStyles.subHeader,
        ),
        const CustomDivider(),
      ],
    );
  }
}

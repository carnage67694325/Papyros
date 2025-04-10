import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagePreview extends StatelessWidget {
  final String imagePath;
  final VoidCallback onRemove;

  const ImagePreview({
    Key? key,
    required this.imagePath,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.r),
        image: DecorationImage(
          image: FileImage(File(imagePath)),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.white,
            size: 24.sp,
          ),
          onPressed: onRemove,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/assets.dart';

class AddImageButton extends StatelessWidget {
  const AddImageButton({
    super.key,
    this.height,
    this.width,
    this.onTap,
  });
  final double? height;
  final double? width;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 50,
        width: width ?? 50,
        decoration: BoxDecoration(
          color: Colors.grey[800]!.withOpacity(0.68), // Dark grey color
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(Assets.assetsIconsCamera),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/assets.dart';
import 'package:papyros/core/utils/functions/pick_image.dart';

class AddImageButton extends StatelessWidget {
  const AddImageButton({
    super.key,
    this.height,
    this.width,
  });
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await pickImage(context);
      },
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

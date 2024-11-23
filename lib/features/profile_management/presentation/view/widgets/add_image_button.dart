import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/assets.dart';

class AddImageButton extends StatelessWidget {
  const AddImageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.grey[800]!.withOpacity(0.75), // Dark grey color
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

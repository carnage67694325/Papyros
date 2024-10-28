import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_icons.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/generated/l10n.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).gettingStarted, style: AppStyles.header),
          const SizedBox(height: 10),
          Text(
            S.of(context).createAccount,
            style: AppStyles.subHeader,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: S.of(context).firstName,
                  hintStyle: AppStyles.textfieldHint,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomTextFormField(
                  hintText: S.of(context).lastName,
                  hintStyle: AppStyles.textfieldHint,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            hintText: S.of(context).yourEmail,
            hintStyle: AppStyles.textfieldHint,
            prefixIcon: Image.asset(AppIcons.assetsIconsEmailicon),
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            obscureText: true,
            hintText: S.of(context).yourPassword,
            hintStyle: AppStyles.textfieldHint,
            prefixIcon: Image.asset(AppIcons.assetsIconsLockPasswordicon),
            suffixIcon: Image.asset(AppIcons.assetsIconsShowPasswordicon),
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            obscureText: true,
            hintText: S.of(context).confirmPassword,
            hintStyle: AppStyles.textfieldHint,
            prefixIcon: Image.asset(AppIcons.assetsIconsLockPasswordicon),
            suffixIcon: Image.asset(AppIcons.assetsIconsShowPasswordicon),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Checkbox(value: false, onChanged: (bool? value) {}),
              Text(S.of(context).agreement),
              GestureDetector(
                onTap: () {},
                child: Text(
                  S.of(context).conditions,
                  style: AppStyles.subHeader.copyWith(
                    color: AppColors.lightPeach,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: AppColors.lightPeach,
            ),
            child: Text(
              S.of(context).register,
              style: AppStyles.header.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: () {
                // Add navigation to login page
              },
              child: Text(
                S.of(context).haveAccount,
                style: AppStyles.subHeader.copyWith(
                  color: AppColors.lightPeach,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.obscureText,
    this.suffixIcon,
  });
  final String hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

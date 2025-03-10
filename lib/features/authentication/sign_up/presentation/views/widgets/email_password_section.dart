import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_icons.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:papyros/features/authentication/sign_up/domain/entities/sign_up_entity.dart';
import 'package:papyros/generated/l10n.dart';
import 'package:papyros/main.dart';

class EmailPassWordSection extends StatefulWidget {
  const EmailPassWordSection({
    super.key,
    required this.signUpEntity,
  });

  final SignUpEntity signUpEntity;

  @override
  State<EmailPassWordSection> createState() => _EmailPassWordSectionState();
}

class _EmailPassWordSectionState extends State<EmailPassWordSection> {
  late String conformPass;
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          onChanged: (data) {
            widget.signUpEntity.emailEntity = data;
          },
          hintText: S.of(context).yourEmail,
          hintStyle: AppStyles.textfieldHint,
          prefixIcon: Padding(
            padding: isArabic()
                ? EdgeInsets.only(
                    right: 16.w, left: 10.w, top: 16.h, bottom: 16.h)
                : EdgeInsets.only(
                    left: 16.w, right: 10.w, top: 16.h, bottom: 16.h),
            child: SvgPicture.asset(
              AppIcons.assetsIconsEmailicon,
              width: 15.w, // Adjust width as needed
              height: 15.h, // Adjust height as needed
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 25),
        CustomTextFormField(
          onChanged: (data) {
            widget.signUpEntity.phoneEntity = data;
          },
          hintText: S.of(context).phone,
          hintStyle: AppStyles.textfieldHint,
          prefixIcon: Padding(
              padding: isArabic()
                  ? EdgeInsets.only(
                      right: 16.w, left: 10.w, top: 16.h, bottom: 16.h)
                  : EdgeInsets.only(
                      left: 16.w, right: 10.w, top: 16.h, bottom: 16.h),
              child: const Icon(
                Icons.phone_android,
                color: AppColors.iconColor,
              )),
        ),
        SizedBox(height: 25.h),
        CustomTextFormField(
          onChanged: (data) {
            widget.signUpEntity.passwordEntity = data;
            conformPass = widget.signUpEntity.phoneEntity;
          },
          obscureText: isObscure,
          hintText: S.of(context).yourPassword,
          hintStyle: AppStyles.textfieldHint,
          prefixIcon: Padding(
            padding: isArabic()
                ? EdgeInsets.only(
                    right: 16.w, left: 10.w, top: 16.w, bottom: 16.w)
                : EdgeInsets.only(
                    left: 16.w, right: 10.w, top: 16.w, bottom: 16.w),
            child: SvgPicture.asset(
              AppIcons.assetsIconsLockPasswordicon,
              width: 20.w,
              height: 25.h,
              fit: BoxFit.contain,
            ),
          ),
          suffixIcon: Padding(
              padding: isArabic()
                  ? EdgeInsets.only(
                      right: 6.w,
                      left: 16.w,
                    )
                  : EdgeInsets.only(
                      left: 6.w,
                      right: 16.w,
                    ),
              child: IconButton(
                onPressed: () {
                  if (isObscure) {
                    setState(() {
                      isObscure = false;
                    });
                  } else {
                    setState(() {
                      isObscure = true;
                    });
                  }
                },
                icon: isObscure
                    ? SvgPicture.asset(
                        AppIcons.assetsIconsShowPasswordicon,
                        width: 15.w,
                        height: 15.h,
                        fit: BoxFit.contain,
                      )
                    : const Icon(Icons.visibility_off),
              )),
        ),
        SizedBox(height: 25.h),
        CustomTextFormField(
          onChanged: (data) {
            if (data == conformPass) {}
          },
          obscureText: isObscure,
          hintText: S.of(context).confirmPassword,
          hintStyle: AppStyles.textfieldHint,
          prefixIcon: Padding(
            padding: isArabic()
                ? EdgeInsets.only(
                    right: 16.w, left: 10.w, top: 16.h, bottom: 16.h)
                : EdgeInsets.only(
                    left: 16.w, right: 10.w, top: 16.h, bottom: 16.h),
            child: SvgPicture.asset(
              AppIcons.assetsIconsLockPasswordicon,
              width: 20.w,
              height: 25.h,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}

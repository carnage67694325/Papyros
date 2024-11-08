import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/app_icons.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:papyros/features/authentication/sign_in/domain/entities/sign_in_entity.dart';
import 'package:papyros/generated/l10n.dart';
import 'package:papyros/main.dart';

class SigninEmailPassWordSection extends StatefulWidget {
  const SigninEmailPassWordSection({
    super.key,
    required this.signInEntity,
  });

  final SignInEntity signInEntity;

  @override
  State<SigninEmailPassWordSection> createState() =>
      _SigninEmailPassWordSectionState();
}

class _SigninEmailPassWordSectionState
    extends State<SigninEmailPassWordSection> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          onChanged: (data) {
            widget.signInEntity.emailEntity = data;
          },
          hintText: S.of(context).yourEmail,
          hintStyle: AppStyles.textfieldHint,
          prefixIcon: Padding(
            padding: isArabic()
                ? const EdgeInsets.only(
                    right: 16, left: 10, top: 16, bottom: 16)
                : const EdgeInsets.only(
                    left: 16, right: 10, top: 16, bottom: 16),
            child: SvgPicture.asset(
              AppIcons.assetsIconsEmailicon,
              width: 15, // Adjust width as needed
              height: 15, // Adjust height as needed
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 25),
        CustomTextFormField(
          onChanged: (data) {
            widget.signInEntity.passwordEntity = data;
          },
          obscureText: isObscure,
          hintText: S.of(context).yourPassword,
          hintStyle: AppStyles.textfieldHint,
          suffixIcon: Padding(
              padding: isArabic()
                  ? const EdgeInsets.only(right: 6, left: 16, top: 0, bottom: 0)
                  : const EdgeInsets.only(
                      left: 6, right: 16, top: 0, bottom: 0),
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
                        width: 15,
                        height: 15,
                        fit: BoxFit.contain,
                      )
                    : const Icon(Icons.visibility_off),
              )),
          prefixIcon: Padding(
            padding: isArabic()
                ? const EdgeInsets.only(
                    right: 16, left: 10, top: 16, bottom: 16)
                : const EdgeInsets.only(
                    left: 16, right: 10, top: 16, bottom: 16),
            child: SvgPicture.asset(
              AppIcons.assetsIconsLockPasswordicon,
              width: 20,
              height: 25,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}

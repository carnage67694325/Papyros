import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:papyros/generated/l10n.dart';

class VerfiyOtpBody extends StatelessWidget {
  const VerfiyOtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 350,
              ),
              const CustomTextFormField(
                hintText: 'verfiy OTP',
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38),
                child: CustomElevatedButton(
                  onPressed: () {},
                  buttonText: Text(S.of(context).sendOTP,
                      style: AppStyles.header.copyWith(
                        color: AppColors.darkBrown,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

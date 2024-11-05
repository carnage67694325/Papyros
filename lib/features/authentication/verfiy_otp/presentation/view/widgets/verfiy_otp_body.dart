import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:papyros/core/utils/app_colors.dart';
import 'package:papyros/core/utils/app_icons.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:papyros/features/authentication/verfiy_otp/domain/entities/verfiy_otp_entity.dart';
import 'package:papyros/features/authentication/verfiy_otp/presentation/manager/verfiy_otp_cubit/verfiy_otp_cubit.dart';
import 'package:papyros/generated/l10n.dart';
import 'package:papyros/main.dart';

class VerfiyOtpBody extends StatefulWidget {
  const VerfiyOtpBody({super.key});

  @override
  State<VerfiyOtpBody> createState() => _VerfiyOtpBodyState();
}

class _VerfiyOtpBodyState extends State<VerfiyOtpBody> {
  late VerfiyOtpEntity verfiyOtpEntity = VerfiyOtpEntity(email: "", otp: "");
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerfiyOtpCubit, VerfiyOtpState>(
      listener: (context, state) {
        if (state is VerfiyOtpSuccess) {
          log("account verified");
        } else if (state is VerfiyOtpFaliure) {
          log('${state.errMessage}');
        }
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 350,
                  ),
                  CustomTextFormField(
                    onChanged: (data) {
                      verfiyOtpEntity.email = data;
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
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormField(
                    onChanged: (data) {
                      verfiyOtpEntity.otp = data;
                    },
                    hintText: 'verfiy OTP',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38),
                    child: CustomElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<VerfiyOtpCubit>(context).verfiyOtp(
                              verfiyOtpEntity.email, verfiyOtpEntity.otp);
                        }
                      },
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
            ),
          )
        ],
      ),
    );
  }
}

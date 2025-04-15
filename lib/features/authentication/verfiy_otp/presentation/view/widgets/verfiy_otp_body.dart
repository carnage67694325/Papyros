import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:papyros/core/utils/app_icons.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/core/utils/functions/success_snack.dart';
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
  final GlobalKey<FormState> formKey = GlobalKey();
  String email = '';
  String otp = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerfiyOtpCubit, VerfiyOtpState>(
      listener: (context, state) {
        if (state is VerfiyOtpSuccess) {
          successSnackBar(context, 'OTP Verified');
        } else if (state is VerfiyOtpFaliure) {
          errorSnackBar(context, state.errMessage);
          log(state.errMessage);
        }
      },
      builder: (context, state) => CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 350.h),
                  CustomTextFormField(
                    onChanged: (data) {
                      email = data;
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
                        width: 15.w,
                        height: 15.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  CustomTextFormField(
                    onChanged: (data) {
                      otp = data;
                    },
                    hintText: 'Verify OTP',
                  ),
                  SizedBox(height: 50.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38),
                    child: CustomElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          final verfiyOtpEntity = VerfiyOtpEntity(
                            emailEntity: email,
                            otpEntity: otp,
                          );
                          await BlocProvider.of<VerfiyOtpCubit>(context)
                              .verfiyOtp(verfiyOtpEntity.emailEntity!,
                                  verfiyOtpEntity.otpEntity!);
                        }
                      },
                      buttonText: state is! VerfiyOtpLoading
                          ? Text(
                              S.of(context).sendOTP,
                              style: AppStyles.header.copyWith(
                                color: Colors.white,
                                fontSize: 24.sp,
                              ),
                            )
                          : LoadingAnimationWidget.threeRotatingDots(
                              color: Colors.white,
                              size: 35,
                            ),
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

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/core/utils/functions/success_snack.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_check_box.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:papyros/features/authentication/sign_up/domain/entities/sign_up_entity.dart';
import 'package:papyros/features/authentication/sign_up/presentation/manager/sign_up/sign_up_cubit.dart';
import 'package:papyros/features/authentication/sign_up/presentation/views/widgets/user_data_section.dart';
import 'package:papyros/generated/l10n.dart';
import 'package:papyros/main.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({
    super.key,
  });

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  SignUpEntity signUpEntity = SignUpEntity(
      firstNameEntity: '',
      lastNameEntity: '',
      emailEntity: '',
      passwordEntity: '',
      phoneEntity: '',
      genderEntity: '',
      dobEntity: '');
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          successSnackBar(context, 'created account');
          GoRouter.of(context).push(AppRouter.kVerfiyOtp);
          log(state.signUpEntity.toString());
        } else if (state is SignUpFailure) {
          errorSnackBar(context, state.errMessage);
          log(state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 50.h,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(26),
              sliver: SliverToBoxAdapter(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      UserDataSection(
                        signUpEntity: signUpEntity,
                      ),
                      SizedBox(height: 45.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CustomCheckBox(),
                              Text(S.of(context).agreement),
                            ],
                          ),
                          Padding(
                            padding: isArabic()
                                ? EdgeInsets.only(right: 30.w)
                                : EdgeInsets.only(left: 50.w),
                            child: CustomTextButton(
                              onTap: () {},
                              buttonText: S.of(context).conditions,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 20.h),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: CustomElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      await BlocProvider.of<SignUpCubit>(context).signUp(
                          firstName: signUpEntity.firstNameEntity,
                          lastName: signUpEntity.lastNameEntity,
                          email: signUpEntity.emailEntity,
                          password: signUpEntity.passwordEntity,
                          phone: signUpEntity.phoneEntity,
                          gender: signUpEntity.genderEntity,
                          dob: signUpEntity.dobEntity);
                    } else {
                      return log('data required');
                    }
                  },
                  buttonText: state is! SignUpLoading
                      ? Text(
                          S.of(context).register,
                          style: AppStyles.header.copyWith(
                            color: Colors.white,
                            fontSize: 24.sp,
                          ),
                        )
                      : LoadingAnimationWidget.threeRotatingDots(
                          color: Colors.white, size: 35),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 20.h),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: CustomTextButton(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kSignIn);
                    },
                    buttonText: S.of(context).haveAccount),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 20.h),
            ),
          ],
        );
      },
    );
  }
}

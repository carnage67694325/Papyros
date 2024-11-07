import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:papyros/core/utils/app_router.dart';
import 'package:papyros/core/utils/app_styles.dart';
import 'package:papyros/core/utils/functions/error_snack.dart';
import 'package:papyros/core/utils/functions/success_snack.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_elevated_button.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/header_section.dart';
import 'package:papyros/features/authentication/presentation/views/widgets/remember_me_section.dart';
import 'package:papyros/features/authentication/sign%20_in/domain/entities/sign_in_entity.dart';
import 'package:papyros/features/authentication/sign%20_in/presentation/views/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:papyros/features/authentication/sign%20_in/presentation/views/widgets/sigin_email_password.dart';
import 'package:papyros/generated/l10n.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  SignInEntity siginEntity = SignInEntity(emailEntity: '', passwordEntity: '');

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          log(state.signInEntity.toString());
          successSnackBar(context, 'logged successfully');
        } else if (state is SignInFailure) {
          log(state.errMessage);
          errorSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) => SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context)
              .viewInsets
              .bottom, // Adds padding when the keyboard opens
        ),
        child: CustomScrollView(
          shrinkWrap:
              true, // Allows the content to be resized within the available space
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 50,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(26),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      HeaderSection(
                          headerText: S.of(context).signIN,
                          subHeaderText: S.of(context).continueYourJourny),
                      const SizedBox(
                        height: 54,
                      ),
                      SigninEmailPassWordSection(
                        signInEntity: siginEntity,
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      CustomTextButton(
                        onTap: () {},
                        buttonText: S.of(context).forgotPass,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const RememberMeSection(),
                      const SizedBox(height: 47),
                      CustomElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<SignInCubit>(context).signIn(
                                email: siginEntity.emailEntity,
                                pass: siginEntity.passwordEntity);
                          } else {
                            return log('data required');
                          }
                        },
                        buttonText: state is! SignInLoading
                            ? Text(
                                S.of(context).signIN,
                                style: AppStyles.header.copyWith(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              )
                            : LoadingAnimationWidget.threeRotatingDots(
                                color: Colors.white, size: 35),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      CustomTextButton(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kSignUp);
                        },
                        buttonText: S.of(context).dontHaveAccount,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: S.of(context).firstName,
                    hintStyle: AppStyles.textfieldHint,
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: S.of(context).lastName,
                    hintStyle: AppStyles.textfieldHint,
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              hintText: S.of(context).yourEmail,
              hintStyle: AppStyles.textfieldHint,
              prefixIcon: Image.asset(AppIcons.assetsIconsEmailicon),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: S.of(context).yourPassword,
              hintStyle: AppStyles.textfieldHint,
              prefixIcon: Image.asset(AppIcons.assetsIconsLockPasswordicon),
              suffixIcon: Image.asset(AppIcons.assetsIconsShowPasswordicon),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: S.of(context).confirmPassword,
              hintStyle: AppStyles.textfieldHint,
              prefixIcon: Image.asset(AppIcons.assetsIconsLockPasswordicon),
              suffixIcon: Image.asset(AppIcons.assetsIconsShowPasswordicon),
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Checkbox(value: false, onChanged: (bool? value) {}),
              Text(S.of(context).agreement),
              GestureDetector(
                onTap: () {
                  // Add your terms and conditions navigation here
                },
                child: Text(
                  S.of(context).conditions,
                  style:
                      AppStyles.subHeader.copyWith(color: AppColors.lightPeach),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: AppColors.lightPeach),
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
                style:
                    AppStyles.subHeader.copyWith(color: AppColors.lightPeach),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

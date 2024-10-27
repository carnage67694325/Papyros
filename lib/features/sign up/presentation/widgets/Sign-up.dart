import 'package:flutter/material.dart';
import 'package:papyros/core/utils/app_icons.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../generated/l10n.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             S.of(context).gettingStarted,
              style:AppStyles.header
            ),
            SizedBox(height: 10),
            Text(
              S.of(context).createAccount
                  ,style: AppStyles.subHeader,
            ),
            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText:S.of(context).firstName
                      ,hintStyle: AppStyles.textfieldHint,


                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText:S.of(context).lastName,
                      hintStyle: AppStyles.textfieldHint,

                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            TextFormField(
              decoration: InputDecoration(
                hintText:S.of(context).yourEmail,
                hintStyle: AppStyles.textfieldHint,
                prefixIcon: Image.asset(AppIcons.assetsIconsEmailicon)
                ,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: S.of(context).yourPassword,
                hintStyle: AppStyles.textfieldHint,
                  prefixIcon: Image.asset(AppIcons.assetsIconsLockPasswordicon),
                suffixIcon:Image.asset(AppIcons.assetsIconsShowPasswordicon),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: S.of(context).confirmPassword,
                hintStyle: AppStyles.textfieldHint,
                prefixIcon: Image.asset(AppIcons.assetsIconsLockPasswordicon),
                suffixIcon: Image.asset(AppIcons.assetsIconsShowPasswordicon),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

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
                    style:AppStyles.subHeader.copyWith(color: AppColors.lightPeach),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              child: Text(S.of(context).register,style: AppStyles.header.copyWith(
                  color: Colors.white,

              ),),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: AppColors.lightPeach
              ),
            ),

            SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Add navigation to login page
                },
                child: Text(
                 S.of(context).haveAccount,
                  style: AppStyles.subHeader.copyWith(color: AppColors.lightPeach)
                  ,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

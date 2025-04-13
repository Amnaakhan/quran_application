import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quran_application/app/config/app_asset.dart';
import 'package:quran_application/app/config/app_colors.dart';
import 'package:quran_application/app/config/app_strings.dart';
import 'package:quran_application/app/config/app_text_style.dart';
import 'package:sizer/sizer.dart';

import '../../../Widget/button_widget.dart';
import 'onboarding_screen2.dart';

class OnboardScreen1 extends StatelessWidget {
  const OnboardScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 4.h),
        child: Column(
          children: [
            Image.asset(AppImages.image),
            SizedBox(height: 3.h,),
            Text(
              AppStrings.onboardText1,
              style: TextStyles.subheading,),
            SizedBox(height: 5.h,),
            Stack(
              children: [
                Image.asset(AppImages.circle,height: 25.h,),
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                    child: Image.asset(AppImages.onboardImg,height: 30.h,)),


              ],
            ),
            SizedBox(height: 5.h,),
            Text(
              AppStrings.onboardText2,
              style: TextStyles.subheading,),
            SizedBox(height: 1.h,),

            Text(

              AppStrings.onboardText3,
              textAlign: TextAlign.center,
              style: TextStyles.regular,),
            SizedBox(height: 5.h,),

            ButtonWidget(text: 'Next', onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => OnboardScreen2(),
                ),
              );
            },
              backgroundColor: AppColors.whiteColor,
              textColor: AppColors.primaryColor,
              borderRadius: 2.h,
            )

          ],

        ),
      )
    );
  }
}

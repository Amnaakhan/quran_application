import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quran_application/MVVM/View/HomeScreen/home_screen.dart';
import 'package:quran_application/app/config/app_asset.dart';
import 'package:quran_application/app/config/app_colors.dart';
import 'package:quran_application/app/config/app_strings.dart';
import 'package:quran_application/app/config/app_text_style.dart';
import 'package:sizer/sizer.dart';

import '../../../Widget/button_widget.dart';

class OnboardScreen2 extends StatelessWidget {
  const OnboardScreen2({super.key});

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
              Image.asset(AppImages.onboardImg1,height: 35.h,),
              SizedBox(height: 5.h,),
              Text(
                AppStrings.onboardText4,
                style: TextStyles.subheading,),
              SizedBox(height: 1.h,),

              Text(

                AppStrings.onboardText5,
                textAlign: TextAlign.center,
                style: TextStyles.regular,),
              SizedBox(height: 5.h,),

              ButtonWidget(text: 'Get started', onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomeScreen(),
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

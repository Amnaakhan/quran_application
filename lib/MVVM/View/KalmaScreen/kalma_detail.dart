import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../app/config/app_asset.dart';
import '../../../app/config/app_colors.dart';
import '../../../app/config/app_text_style.dart';
import '../../api_responce_model/kalma_detail_model.dart';

class KalimaDetailScreen extends StatelessWidget {
  final kalmaList kalima;

  const KalimaDetailScreen({super.key, required this.kalima});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [

          Stack(
            children: [
              Image.asset(
                  AppImages.card
              ),
              Positioned(
                  top: 5.h,
                  left: 5.w,
                  child: Text('Assalamu Alaikum',style: TextStyles.boldtext,)),
              Positioned(
                  top: 10.h,
                  left: 5.w,
                  child: Text('Next Prayer Time',style: TextStyles.regularhometext1,)),
              Positioned(
                  top: 12.h,
                  left: 5.w,
                  child: Text('Zuhr - 01:30 PM',style: TextStyles.boldtext,)),
              Positioned(
                  top: 18.h,
                  left: 5.w,
                  child: Row(
                    children: [
                      Icon(Icons.location_pin,color: AppColors.primaryColor,size: 2.h,),
                      Text('Islamabad, Pakistan',style: TextStyles.regularhometext1,),
                    ],
                  ))
            ],
          ),
          SizedBox(height: 2.h,),
          Image.asset(
              AppImages.bismiAllah,
            height: 5.h,
          ),
          SizedBox(height: 2.h,),
          Container(height: 7.h,
            width: double.infinity,
            margin: EdgeInsets.only(left: 5.w,right: 5.w),
            padding: EdgeInsets.only(left: 5.w,right: 5.w,),

            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppImages.cardImg,),fit: BoxFit.fill)
            ),
            child: Row(
              children: [
                Container(
                  height: 5.h,
                  width: 5.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(AppImages.starwhite,))
                  ),
                  child: Center(child: Text('${kalima.number}',style: TextStyles.regularwhitetext,)),

                ),
                SizedBox(width: 3.w,),
                Text(
                  "${kalima.title} ",
                  style: TextStyles.regularwhitetext,
                ),
                Spacer(),
                Text(
                  "(${kalima.arabicTitle}) ",
                  style: TextStyles.regularwhitetext,
                ),
              ],
            ),
          ),
          SizedBox(height: 3.h,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 5.w,right: 5.w,top: 1.h,bottom: 2.h),
            margin: EdgeInsets.only(left: 5.w,right: 5.w,),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppImages.cardImg1,

              ),fit: BoxFit.fill
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment:Alignment.centerRight,
                  child: Text(
                    kalima.arabicContent,
                    textAlign: TextAlign.right,
                    style: TextStyles.kalmatext
                  ),

                ),
                SizedBox(height: 1.h,),

                Divider(color: AppColors.blackColor.withOpacity(0.18),),

                Text(
                    kalima.englishTranslation,
                    style: TextStyles.searchtext
                ),
              ],
            ),
          ),




        ],
      ),
    );
  }
}

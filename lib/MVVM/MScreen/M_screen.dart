import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../app/config/app_asset.dart';
import '../../app/config/app_colors.dart';
import '../../app/config/app_strings.dart';
import '../../app/config/app_text_style.dart';
import '../api_responce_model/M_list.dart';

class MScreen extends StatefulWidget {
  const MScreen({super.key});

  @override
  State<MScreen> createState() => _MScreenState();
}

class _MScreenState extends State<MScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          SizedBox(height: 3.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Container(
              height: 6.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff000000).withOpacity(0.11),
                      blurRadius: 8,
                      offset: Offset(0, 0),
                    )
                  ]
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Image.asset(
                      AppImages.searchIcon,
                      height: 2.h,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: AppStrings.searchkalma,
                        hintStyle: TextStyles.searchtext,
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 3.h),
          Expanded(child: _buildListView())
        ],
      ),
    );
  }
  Widget _buildListView() {



    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: ProphetNames.length,
      itemBuilder: (context, index) {
        final name = ProphetNames[index];
        return
          Padding(
            padding: EdgeInsets.only(top: 1.h,left: 4.w,right: 3.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 6.h,
                      width: 6.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(AppImages.star))
                      ),
                      child: Center(child: Text('${index + 1}',style: TextStyle(),)),

                    ),
                    SizedBox(width: 3.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${name.english}',style: TextStyles.Asmaulhusnatext,),
                        Text('${name.meaning} ',style: TextStyles.surahtextsmall,)

                      ],
                    ),
                    Spacer(),
                    Text('(${name.arabic})',style: TextStyles.Asmaulhusnatext,),

                  ],
                ),
                Divider(color: AppColors.blackColor.withOpacity(0.18),)
              ],
            ),
          );

      },
    );

  }

}

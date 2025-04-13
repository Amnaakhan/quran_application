import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_application/MVVM/body_model/para_list.dart';
import 'package:quran_application/app/config/app_asset.dart';
import 'package:quran_application/app/config/app_colors.dart';
import 'package:quran_application/app/config/app_strings.dart';
import 'package:sizer/sizer.dart';

import '../../../app/config/app_text_style.dart';
import '../../view_model/surah_view_model.dart';

class SurahParaListScreen extends StatefulWidget {
  const SurahParaListScreen({super.key});

  @override
  State<SurahParaListScreen> createState() => _SurahParaListScreenState();
}

class _SurahParaListScreenState extends State<SurahParaListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final SurahViewModel viewModel = Get.put(SurahViewModel());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// Header
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

          /// Custom TabBar Container
          Container(
            margin: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
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
                _buildTabButton(AppStrings.paraList, 0),
                _buildTabButton(AppStrings.surahList, 1),
              ],
            ),
          ),

          /// Search bar
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
                        hintText: AppStrings.searchList,
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

          SizedBox(height: 2.h),

          /// TabBarView
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildListParaView(),
                _buildListSurahView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Tab Button Builder
  Widget _buildTabButton(String title, int index) {
    bool isSelected = _tabController.index == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _tabController.animateTo(index);
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            gradient: isSelected ?AppColors.surahTabGradient: AppColors.transparentGradient,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              title,
              style: isSelected ? TextStyles.regularwhitetext:TextStyles.regulartext
            ),
          ),
        ),
      ),
    );
  }

  /// List View
  Widget _buildListSurahView() {
    return Obx(() {
      if (viewModel.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: viewModel.surahList.length,
        itemBuilder: (context, index) {
          final surah = viewModel.surahList[index];
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
                        Text('${surah.surahName}',style: TextStyles.surahtext,),
                        Text('${surah.surahNameTranslation} • ${surah.revelationPlace} ',style: TextStyles.surahtextsmall,)

                      ],
                    ),
                    Spacer(),
                    Text('(${surah.surahNameArabicLong})',style: TextStyles.surahtext,),

                  ],
                ),
                Divider(color: AppColors.blackColor.withOpacity(0.18),)
              ],
            ),
          );

        },
      );
    });
  }
  Widget _buildListParaView() {
    return Obx(() {
      if (viewModel.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: juzList.length,
        itemBuilder: (context, index) {
          final juz = juzList[index];
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
                          Text('${juz.juzName}',style: TextStyles.surahtext,),
                          Text('${juz.start} ',style: TextStyles.surahtextsmall,)

                        ],
                      ),
                      Spacer(),
                      Text('(${juz.juzArabicname})',style: TextStyles.surahtext,),

                    ],
                  ),
                  Divider(color: AppColors.blackColor.withOpacity(0.18),)
                ],
              ),
            );

        },
      );
    });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quran_application/MVVM/AsmaulHusnaScreen/AsmaulHusnaScreen.dart';
import 'package:quran_application/MVVM/MScreen/M_screen.dart';
import 'package:quran_application/MVVM/View/KalmaScreen/kalma_screen.dart';
import 'package:quran_application/MVVM/View/listScreens/surah_para_screen.dart';
import 'package:quran_application/app/config/app_asset.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/app_strings.dart';
import '../../../app/config/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(),
      body: Builder(

        builder: (context) =>  Padding(
          padding: EdgeInsets.only(top: 5.h, left: 4.w, right: 3.5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer(); // This will throw error outside of Builder
                    },
                    child: Image.asset(
                      AppImages.drawerIcon,
                      height: 3.5.h,
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Text(
                    AppStrings.homeTitle,
                    style: TextStyles.heading,
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      AppStrings.homeIslamicDate,
                      style: TextStyles.regularhome,
                    ),
                    Text(
                      AppStrings.homeEngDate,
                      style: TextStyles.regularhome,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                height: 20.h,
                width: double.infinity,
                padding: EdgeInsets.only(left: 5.w,top: 2.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.h),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(0, 4), // changes position of shadow
                      ),
                    ],
                    image: DecorationImage(
                        image: AssetImage(AppImages.card), fit: BoxFit.fill)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Assalamu Alaikum',style: TextStyles.boldtext,),
                    SizedBox(height: 3.h,),
                    Text('Next Prayer Time',style: TextStyles.regularhometext1,),
                    Text('Zuhr - 01:30 PM',style: TextStyles.boldtext,),
                    SizedBox(height: 3.h,),

                    Row(
                      children: [
                        Icon(Icons.location_pin,color: AppColors.primaryColor,size: 2.h,),
                        Text('Islamabad, Pakistan',style: TextStyles.regularhometext1,),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                AppStrings.homeCategory,
                style: TextStyles.regularhome,
              ),
              SizedBox(height: 2.h,),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SurahParaListScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 29.h,
                      width: 46.w,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(AppImages.quranCard),fit: BoxFit.fill)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.quranImg),
                          SizedBox(height: 1.h,),
                          Text(AppStrings.homeQuran,style: TextStyles.regularhometext,)
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => KalmaScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 14.h,
                          width: 46.w,
                          padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),

                          decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(AppImages.kalmaCard),fit: BoxFit.fill)
                                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.tasbeehImg,height: 7.h),
                              SizedBox(height: 1.h,),
                              Text(AppStrings.homeKalma,style: TextStyles.regularhometext,)
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: Container(
                          height: 14.h,
                          width: 46.w,
                          padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),

                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(AppImages.kalmaCard),fit: BoxFit.fill)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.duaImg,height: 7.h,),
                              SizedBox(height: 1.h,),
                              Text(AppStrings.homedua,style: TextStyles.regularhometext,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 3.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AsmaulHusnaScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 13.h,
                          width: 29.w,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppImages.azanCard),fit: BoxFit.fill
                            )
                          ),
                          child:
                              Center(child: Image.asset(AppImages.Aname,height: 7.h,)),


                        ),
                      ),
                      SizedBox(height: 2.h,),
                      Text(AppStrings.homename,style: TextStyles.regularhometext1,)
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 13.h,
                          width: 29.w,
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(AppImages.azanCard),fit: BoxFit.fill
                              )
                          ),
                          child:
                              Center(child: Image.asset(AppImages.Mname,height: 7.h,)),

                        ),
                      ),
                      SizedBox(height: 2.h,),
                      Text(AppStrings.homenname,style: TextStyles.regularhometext1,)

                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 13.h,
                        width: 29.w,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppImages.azanCard),fit: BoxFit.fill
                            )
                        ),
                        child:
                            Center(child: Image.asset(AppImages.masjid,height: 7.h,)),



                      ),
                      SizedBox(height: 2.h,),
                      Text(AppStrings.homemsjid,style: TextStyles.regularhometext1,)
                    ],
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.primaryColor),
            child: Text('Quran App', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Surahs'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => SurahParaListScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Asmaul Husna'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => AsmaulHusnaScreen()));
            },
          ),
          InkWell(

            child: ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text('Privacy Policy'),
              onTap: _launchPrivacyPolicy
            ),
          ),
          // Add more items as needed
        ],
      ),
    );
  }
  Future<void> _launchPrivacyPolicy() async {
    final Uri url = Uri.parse('https://sites.google.com/view/prime-products/home');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch privacy policy URL';
    }
  }
}

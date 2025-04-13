import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quran_application/MVVM/View/KalmaScreen/kalma_screen.dart';
import 'package:quran_application/MVVM/View/Onboarding/onboarding_screen2.dart';
import 'package:quran_application/MVVM/View/listScreens/surah_para_screen.dart';
import 'package:sizer/sizer.dart';

import 'MVVM/MScreen/M_screen.dart';
import 'MVVM/View/HomeScreen/home_screen.dart';
import 'MVVM/View/Onboarding/onboarding_screen1.dart';
import 'MVVM/View/splash/splash_screen.dart';
import 'app/config/app_routes.dart';

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(


          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        onGenerateRoute: Routes.generateRoute,
      );
    });
  }
}


import 'package:flutter/material.dart';

import '../../../app/config/app_asset.dart';
import '../../../app/config/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    // Ensure context is available before preloading images

      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, RouteName.onboardScreen);
      });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
          AppImages.splashImg,
        ),fit: BoxFit.fill)),

      ),
    );
  }
}

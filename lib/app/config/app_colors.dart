import 'package:flutter/material.dart';

class AppColors{
  static const Color primaryColor = Color(0xff663F47);
  static const Color whiteColor = Color(0xffffffff);
  static const Color blackColor = Color(0xff000000);


  static LinearGradient surahTabGradient = const LinearGradient(
    colors: [
      Color(0xff663F47),
      Color(0xffC99077),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static LinearGradient transparentGradient = const LinearGradient(
    colors: [
      Colors.transparent,
      Colors.transparent,

    ],

  );
}
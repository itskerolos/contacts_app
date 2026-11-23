import 'package:contact_app/core/gen/fonts.gen.dart';
import 'package:contact_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';



abstract class AppStyles {

  static const TextStyle titleOne = TextStyle(
    fontSize: 20,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.inter,
  );
  static const TextStyle titleTwo = TextStyle(
    fontSize: 20,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.inter,
  );
  static const TextStyle titleThree = TextStyle(
    fontSize: 16,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.inter,
  );
  static const TextStyle titleFour = TextStyle(
    fontSize: 16,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w400,
    fontFamily: FontFamily.inter,
  );
  static const TextStyle titleFive = TextStyle(
    fontSize: 14,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.inter,
  );
  static const TextStyle titleSix = TextStyle(
    fontSize: 10,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w500,
    fontFamily: FontFamily.inter,
  );
}
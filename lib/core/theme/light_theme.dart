import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_color.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  primarySwatch: Colors.brown,
  scaffoldBackgroundColor: AppColors.scaffoldColor,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: AppColors.scaffoldColor,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: AppColors.textBodyMediumColor,
    ),
    iconTheme: IconThemeData(
      color: AppColors.primaryColor,
      size: 15,
    ),
  ),
  textTheme: TextTheme(
    bodySmall: TextStyle(
      fontSize: 14,
      color: AppColors.textBodyMediumColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 20,
      color: AppColors.textBodyMediumColor,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      fontSize: 40,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryColor,
    ),
    displayMedium: TextStyle(
      fontSize: 16,
      color: AppColors.textBodyMediumColor,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      color: AppColors.textBodyMediumColor,
      fontSize: 16,
    ),
    displayLarge: TextStyle(
      fontSize: 16,
      color: AppColors.textBodyMediumColor,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      color: AppColors.primaryColor,
      overflow: TextOverflow.ellipsis,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      color: AppColors.textBodyMediumColor,
    ),
    labelLarge: TextStyle(
      fontSize: 24,
      color: AppColors.textBodyMediumColor,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.ellipsis,
    ),
    labelMedium: TextStyle(
      fontSize: 20,
      color: AppColors.textBodyMediumColor,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      color: AppColors.textBodyMediumColor,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
        fontSize: 16,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.bold),
    headlineLarge: TextStyle(
      fontSize: 28,
      color: AppColors.textBodyMediumColor,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: 14,
      color: AppColors.textBodyMediumColor,
      fontWeight: FontWeight.w500,
    ),

  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.all<Color>(AppColors.textBodyMediumColor),
        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
          fontSize: 14,
          color: AppColors.textBodyMediumColor,
          fontWeight: FontWeight.bold,
        ))),
  ),
  iconTheme: IconThemeData(
    color: AppColors.textBodyMediumColor,
    size: 27.r,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.scaffoldColor,
    //   elevation: 5,
    selectedIconTheme: IconThemeData(
      size: 14.r,
    ),
    //   unselectedIconTheme: IconThemeData(
    //     color: AppColors.colorIconButtonNavBar,
    //     size: 20,
    //   ),
    //   selectedItemColor: AppColors.colorIconButtonNavBar,
    //   unselectedItemColor: AppColors.colorIconButtonNavBar,
    //   selectedLabelStyle: TextStyle(
    //     fontSize: 16,
    //     fontWeight: FontWeight.bold,
    //     color: AppColors.colorIconButtonNavBar,
    //   ),
    //
  ),
);

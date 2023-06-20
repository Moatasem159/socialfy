import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socialfy/core/utils/colors_manager.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/utils/values_manager.dart';
class AppTheme{
  static final lightTheme=ThemeData(
    fontFamily: FontConstants.fontFamily,
    primaryColorLight: Colors.white,
    colorScheme: const ColorScheme.light().copyWith(background: AppColors.backGroundLightThemeColor),
    primaryColor: AppColors.primaryLightThemeColor,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.black),
      toolbarTextStyle:const TextStyle(
        color: Colors.black,
        fontFamily: FontConstants.billaBong,
        fontSize: 35
      ),
      actionsIconTheme:  const IconThemeData(
        color: Colors.black,
        size: 33,
      ),
      titleSpacing: 10,
      titleTextStyle: const TextStyle(
          color: Colors.black,
        fontSize: AppSize.s35,
        fontFamily: FontConstants.fontFamily,
        fontWeight: FontWeightManager.medium
      ),
      backgroundColor:  Colors.transparent,
      elevation: 0,
      systemOverlayStyle: setStatusBarAndNavigationBarColors(false),
    ),
    elevatedButtonTheme:ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primaryLightThemeColor),
        textStyle: MaterialStateProperty.all(const TextStyle(
          color: Colors.white,
          fontFamily: FontConstants.fontFamily
        ))
      )
    ),
    inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(color: Colors.grey),
    contentPadding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
    suffixIconColor:AppColors.primaryLightThemeColor,
    prefixIconColor: AppColors.primaryLightThemeColor,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color:AppColors.primaryLightThemeColor)),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color:AppColors.primaryLightThemeColor,
        )
    ),
    errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color:Colors.red
        )
    ),
    ),
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
      elevation: 0,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      backgroundColor: AppColors.backGroundLightThemeColor,
      selectedItemColor: AppColors.primaryDarkColor,
      selectedIconTheme: IconThemeData(color: AppColors.primaryDarkColor),
      type: BottomNavigationBarType.fixed,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black
)
  );
  static final darkTheme=ThemeData(
    colorScheme: const ColorScheme.dark().copyWith(
      background: AppColors.backGroundDarkThemeColor,
    ),
    primaryColor: AppColors.primaryDarkThemeColor,
    fontFamily: FontConstants.fontFamily,
    primaryColorLight: Colors.grey[900],
    appBarTheme:  AppBarTheme(
      backgroundColor:  AppColors.backGroundDarkThemeColor,
      iconTheme: const IconThemeData(color: Colors.white),
      toolbarTextStyle:const TextStyle(
          color: Colors.white,
          fontFamily: FontConstants.billaBong,
          fontSize: 35
      ),
      titleSpacing: 10,
      actionsIconTheme: const IconThemeData(
        color: Colors.white,
        size: 33,
      ),
      titleTextStyle: const TextStyle(
          color: Colors.white,
        fontSize: AppSize.s35,
        fontFamily: FontConstants.fontFamily,
        fontWeight: FontWeightManager.medium,
      ),
      elevation: 0,
      systemOverlayStyle:setStatusBarAndNavigationBarColors(true),
    ),
    elevatedButtonTheme:ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.primaryDarkThemeColor),
              textStyle: MaterialStateProperty.all( const TextStyle(
                  color: Colors.black,
                fontFamily: FontConstants.fontFamily
              )
              )
          ),
      ),
    inputDecorationTheme:  InputDecorationTheme(
      hintStyle: const TextStyle(
          color: Colors.grey
      ),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 3, vertical: 0),
      suffixIconColor:AppColors.primaryDarkThemeColor,
      prefixIconColor: AppColors.primaryDarkThemeColor,


      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color:AppColors.primaryDarkThemeColor,
          )
      ),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color:AppColors.primaryDarkThemeColor,
          )
      ),
      errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              width: 1,
              color:Colors.red
          )
      ),
  ),
    bottomNavigationBarTheme:BottomNavigationBarThemeData(
        elevation: 0,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        backgroundColor: AppColors.backGroundDarkThemeColor,
        unselectedItemColor: Colors.white.withOpacity(.5),
        selectedItemColor: AppColors.primaryLightColor,
        type: BottomNavigationBarType.fixed,
),
    iconTheme: const IconThemeData(
      color: Colors.white
    )


  );
  static setStatusBarAndNavigationBarColors(bool dark) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: dark? AppColors.backGroundDarkThemeColor
          : AppColors.backGroundLightThemeColor,
      systemNavigationBarIconBrightness:dark
          ? Brightness.light
          : Brightness.dark,
      statusBarColor: dark
          ? AppColors.backGroundDarkThemeColor
          : AppColors.backGroundLightThemeColor,
      statusBarIconBrightness:dark
          ? Brightness.light
          : Brightness.dark,


    ));
  }

}
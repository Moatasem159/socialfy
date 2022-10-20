import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:socialfy/core/utils/colors_manager.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/utils/values_manager.dart';

class AppTheme{
  const AppTheme._();

  static final lightTheme=ThemeData(
    fontFamily: FontConstants.fontFamily,
    primaryColorLight: AppColors.primaryLightColor,
    backgroundColor: AppColors.backGroundLightThemeColor,
    primaryColor: AppColors.primaryLightThemeColor,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      toolbarTextStyle:TextStyle(
        color: Colors.black
      ),

      actionsIconTheme:  IconThemeData(
        color: Colors.black,
        size: 33,
      ),
      titleSpacing: 10,
      titleTextStyle: TextStyle(
          color: Colors.black,
        fontSize: AppSize.s35,
        fontFamily: FontConstants.fontFamily,
        fontWeight: FontWeightManager.medium
      ),
      backgroundColor:  Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark
      ),
    ),
    textTheme: const TextTheme(
      button: TextStyle(
          color: Colors.white
      ),
        labelMedium: TextStyle(
            color: Colors.black
        ),
      bodyText1:TextStyle(
          color: Colors.black
      ),
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
    hintStyle: const TextStyle(
      color: Colors.grey
    ),
    contentPadding: const EdgeInsets.symmetric(
          horizontal: 3, vertical: 0),
    suffixIconColor:AppColors.primaryLightThemeColor,
    prefixIconColor: AppColors.primaryLightThemeColor,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color:AppColors.primaryLightThemeColor,
      )
    ),
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
      // unselectedItemColor: Colors.black.withOpacity(.5),
      selectedItemColor: AppColors.primaryDarkColor,
      selectedIconTheme: IconThemeData(
        color: AppColors.primaryDarkColor,
      ),
      type: BottomNavigationBarType.fixed,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black
)

  );


  static final darkTheme=ThemeData(
    backgroundColor: AppColors.backGroundDarkThemeColor,
    primaryColor: AppColors.primaryDarkThemeColor,
    fontFamily: FontConstants.fontFamily,
    primaryColorLight: AppColors.primaryDarkColor,
    appBarTheme:  AppBarTheme(
      backgroundColor:  AppColors.backGroundDarkThemeColor,
      iconTheme: const IconThemeData(color: Colors.white),
      toolbarTextStyle:const TextStyle(
          color: Colors.white
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
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light
      ),
    ),
    textTheme: const TextTheme(
        button: TextStyle(
            color: Colors.black
        ),
      labelMedium: TextStyle(
        color: Colors.white
      ),
      bodyText1:TextStyle(
          color: Colors.white
      ),
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
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
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

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

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
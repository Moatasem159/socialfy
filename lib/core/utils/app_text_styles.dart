import 'package:flutter/material.dart';
import 'package:socialfy/core/utils/font_manager.dart';
abstract class AppTextStyles{
  static TextStyle getNormalText({
    required double fontSize,
    required Color color}){
    return TextStyle(
      color:color,
      fontSize: fontSize,
      fontFamily: FontConstants.fontFamily,

    );
  }
  static TextStyle getBoldText({
    required double fontSize,
    FontWeight weight=FontWeightManager.bold,
    required Color color}){
    return TextStyle(
      color:color,
      fontSize: fontSize,
      fontWeight: weight,
      fontFamily: FontConstants.fontFamily,

    );
  }
}
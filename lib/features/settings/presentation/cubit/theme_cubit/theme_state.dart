import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
abstract class ThemeStates extends Equatable{
  final ThemeMode mood;
  const ThemeStates(this.mood);
  @override
  List<Object> get props => [mood];
}
class ChangeThemeState extends ThemeStates {
  final ThemeMode stateMood;
  const ChangeThemeState(this.stateMood): super(stateMood);
}
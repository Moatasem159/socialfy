

import 'package:equatable/equatable.dart';

abstract class ThemeStates extends Equatable {
  @override
  List<Object> get props => [];
}

class ThemeInitialState extends ThemeStates {

}

class ChangeAppThemeLoadingState extends ThemeStates{}
class ChangeAppThemeDoneState extends ThemeStates{}
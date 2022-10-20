

import 'package:equatable/equatable.dart';

abstract class BottomNavigationStates extends Equatable {
  @override
  List<Object> get props => [];
}

class BottomNavigationInitialState extends BottomNavigationStates {}
class ChangeBottomNavLoadingState extends BottomNavigationStates{}
class ChangeBottomNavDoneState extends BottomNavigationStates{}
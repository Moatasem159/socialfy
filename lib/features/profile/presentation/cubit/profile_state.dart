

import 'package:equatable/equatable.dart';

abstract class ProfileStates extends Equatable {
  @override
  List<Object> get props => [];
}

class ProfileInitialState extends ProfileStates {}
class GetProfileLoadingState extends ProfileStates {}
class GetProfileSuccessState extends ProfileStates {}
class GetProfileErrorState extends ProfileStates {}

class GetProfilePostsLoadingState extends ProfileStates {}
class GetProfilePostsSuccessState extends ProfileStates {}
class GetProfilePostsErrorState extends ProfileStates {}

class LogoutLoadingState extends ProfileStates{}
class LogoutDoneState extends ProfileStates{}

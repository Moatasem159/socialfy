import 'package:equatable/equatable.dart';
import 'package:socialfy/core/entities/user.dart';
abstract class ProfileStates extends Equatable {
  @override
  List<Object> get props => [];
}
class ProfileInitialState extends ProfileStates {}
class GetProfileLoadingState extends ProfileStates {}
class GetProfileSuccessState extends ProfileStates {
  final User profile;
  GetProfileSuccessState(this.profile);
}
class GetProfileErrorState extends ProfileStates {}
class LogoutLoadingState extends ProfileStates{}
class LogoutDoneState extends ProfileStates{}
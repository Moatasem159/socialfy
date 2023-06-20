import 'package:equatable/equatable.dart';
abstract class LoginStates extends Equatable {
  const LoginStates();
  @override
  List<Object> get props => [];
}
class LoginInitialState extends LoginStates {}
class LoginLoadingState extends LoginStates {}
class LoginSuccessState extends LoginStates {
  final String uId;
  const LoginSuccessState({required this.uId});
  @override
  List<Object> get props => [uId];
}
class LoginErrorState extends LoginStates {
  final String msg;
  const LoginErrorState({required this.msg});
  @override
  List<Object>get props=>[msg];
}
class ChangePasswordVisibilityLoading extends LoginStates{}
class ChangePasswordVisibilityDone extends LoginStates{}
class ClearTextDoneState extends LoginStates{}
class UserTypingSuccessState extends LoginStates{}
class UserTypingLoadingState extends LoginStates{}


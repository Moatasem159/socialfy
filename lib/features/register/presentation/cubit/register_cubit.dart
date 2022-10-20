import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/register/domain/usecases/register_use_case.dart';
import 'package:socialfy/features/register/presentation/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit({required this.registerUseCase}) : super(RegisterInitialState());
  final RegisterUseCase registerUseCase;


  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  IconData passSuffix = Icons.visibility_outlined;
  IconData confirmPassSuffix = Icons.visibility_outlined;
  bool passIsHidden = true;
  bool confirmPassIsHidden = true;

  void changePasswordVisibility() {
    emit(ChangePasswordVisibilityLoading());
    passIsHidden = !passIsHidden;
    passSuffix =
    passIsHidden ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityDone());
  }
  void changeConfirmPasswordVisibility() {
    emit(ChangePasswordVisibilityLoading());
    confirmPassIsHidden = !confirmPassIsHidden;
    confirmPassSuffix =
    confirmPassIsHidden ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityDone());
  }
  void clearName(){
    nameController.clear();
    emit(ClearTextDoneState());
  }
  void clearEmail(){
    emailController.clear();
    emit(ClearTextDoneState());
  }
  void clearPhone(){
    phoneController.clear();
    emit(ClearTextDoneState());
  }


  Future<void> userRegister({
    required String email,
    required String password,
    required String name,
    required String phone}) async{
    emit(UserRegisterLoadingState());
    Either<Failure, UserCredential> response = await registerUseCase.call(
        email: email, password: password, name: name, phone: phone);
    response.fold((failure){
      emit(UserRegisterErrorState(msg: failure.message!,));
    }, (done){
      emit(UserRegisterSuccessState(registerDataModel: done));
    });
  }














}

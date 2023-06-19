import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/features/register/domain/usecases/register_use_case.dart';
import 'package:socialfy/features/register/presentation/cubit/register_state.dart';
class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit(this._registerUseCase) : super(RegisterInitialState());
  final RegisterUseCase _registerUseCase;
  static RegisterCubit get(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  IconData passSuffix = Icons.visibility_outlined;
  IconData confirmPassSuffix = Icons.visibility_outlined;
  bool passIsHidden = true;
  bool confirmPassIsHidden = true;
  void changePasswordVisibility() {
    emit(ChangePasswordVisibilityLoading());
    passIsHidden = !passIsHidden;
    passSuffix = passIsHidden
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityDone());
  }
  void typing(String value){

    if(value.length<=1)
      {
        emit(UserTypingLoadingState());
        emit(UserTypingSuccessState());
      }
  }
  void changeConfirmPasswordVisibility() {
    emit(ChangePasswordVisibilityLoading());
    confirmPassIsHidden = !confirmPassIsHidden;
    confirmPassSuffix = confirmPassIsHidden
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityDone());
  }
  void clearName() {
    nameController.clear();
    emit(ClearTextDoneState());
  }
  void clearEmail() {
    emailController.clear();
    emit(ClearTextDoneState());
  }
  void clearPhone() {
    phoneController.clear();
    emit(ClearTextDoneState());
  }
  Future<void> userRegister() async {
    if (formKey.currentState!.validate()) {
      emit(UserRegisterLoadingState());
      Either<Failure, UserCredential> response = await _registerUseCase.call(
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text,
          phone: phoneController.text);
      response.fold(
            (failure) => emit(UserRegisterErrorState(msg: failure.message!)),
            (done) =>emit(UserRegisterSuccessState(registerDataModel: done)));
    }
  }
}

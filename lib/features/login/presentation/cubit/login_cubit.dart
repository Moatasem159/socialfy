

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/shared/shared_prefrences_consumer.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/login/domain/usecases/login_use_case.dart';
import 'package:socialfy/features/login/presentation/cubit/login_state.dart';
import 'package:socialfy/features/post/presentation/cubit/post_cubit.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit({required this.loginUseCase,required this.sharedPrefrencesConsumer}) : super(LoginInitialState());


  final LoginUseCase loginUseCase;
  final SharedPrefrencesConsumer sharedPrefrencesConsumer;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  IconData passSuffix = Icons.visibility_outlined;
  bool passIsHidden = true;

  void clearEmail(){
    emailController.clear();
    emit(ClearTextDoneState());
  }
  void changePasswordVisibility() {
    emit(ChangePasswordVisibilityLoading());
    passIsHidden = !passIsHidden;
    passSuffix =
    passIsHidden ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityDone());
  }

  Future<void> userLogin({required String email,required String password,required BuildContext context})async{
    emit(LoginLoadingState());
    Either<Failure,UserCredential> response= await loginUseCase.call(email: email, password: password);
    response.fold((failure){
      emit(LoginErrorState(msg: failure.message!));
    }, (done)async{
      sharedPrefrencesConsumer.saveData(
          key: AppStrings.userLoggedIn, value:done.user!.uid);
      AppStrings.userLoggedInId=done.user!.uid;
      BlocProvider.of<ProfileCubit>(context).getProfile();
      BlocProvider.of<PostCubit>(context).getNewFeed();
      emit(LoginSuccessState(uId: done.user!.uid));
    });
  }
}

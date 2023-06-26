import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/error/failures.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/widgets/toast/custom_toast.dart';
import 'package:socialfy/features/login/domain/usecases/login_use_case.dart';
import 'package:socialfy/features/login/presentation/cubit/login_state.dart';
import 'package:socialfy/core/models/user_model.dart';
import 'package:socialfy/features/messenger/presentation/cubits/get_all_user_cubit/get_all_users_cubit.dart';
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this._loginUseCase) : super(LoginInitialState());
  final LoginUseCase _loginUseCase;
  static LoginCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  IconData passSuffix = Icons.visibility_outlined;
  bool passIsHidden = true;
  void clearEmail() {
    emailController.clear();
    emit(ClearTextDoneState());
  }
  void typing(String value){
    if(value.length<=1)
    {
      emit(UserTypingLoadingState());
      emit(UserTypingSuccessState());
    }
  }
  void changePasswordVisibility() {
    emit(ChangePasswordVisibilityLoading());
    passIsHidden = !passIsHidden;
    passSuffix = passIsHidden ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityDone());
  }
  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      Either<Failure, UserDataModel> response = await _loginUseCase.call(
          email: emailController.text, password: passwordController.text);
      response.fold((failure) => emit(LoginErrorState(msg: failure.message!)),
          (done) => emit(LoginSuccessState(uId: done.uId!)));
    }
  }
  void listen(context, state) {
    if (state is LoginSuccessState) {
      CustomToast.showToast(
        context,
        msg: AppStrings.loginSuccessfullyMsg,
      );
      GetAllUsersCubit.get(context).getAllUsers();
      GoRouter.of(context).pushReplacementNamed(Routes.mainScreenRoute);
    }
    if (state is LoginErrorState) {
      CustomToast.showToast(context, msg: state.msg);
    }
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/widgets/buttons.dart';
import 'package:socialfy/core/widgets/loading_widget.dart';
import 'package:socialfy/core/widgets/text_form_field.dart';
import 'package:socialfy/features/register/presentation/cubit/register_cubit.dart';
import 'package:socialfy/features/register/presentation/cubit/register_state.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    var cubit = BlocProvider.of<RegisterCubit>(context);
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if(state is UserRegisterSuccessState)
        {
          Fluttertoast.showToast(
              msg: AppStrings.registerSuccessfullyMsg,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.black,
              fontSize: 16.0);
          Navigator.pushNamed(context, Routes.loginScreenRoute);
        }
        if(state is UserRegisterErrorState)
          {
            Fluttertoast.showToast(
                msg: state.msg,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.black,
                fontSize: 16.0);
          }
      },
      builder: (context, state) {
        return Form(
            key: formKey,
            child: Column(
              children: [
                MainTextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.nameRequired;
                    }
                    else {
                      return null;
                    }
                  },
                  controller: cubit.nameController,
                  hintText: AppStrings.nameHint,
                  suffixIcon: GestureDetector(
                      onTap: () {
                        cubit.clearName();
                      },
                      child: const Icon(Icons.clear)),
                  prefixIcon: const Icon(Icons.person),
                  inputType: TextInputType.name,
                ),
                const SizedBox(
                  height: 10,
                ),
                MainTextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.emailRequired;
                    } else {
                      return null;
                    }
                  },
                  controller: cubit.emailController,
                  hintText: AppStrings.emailHint,
                  suffixIcon: GestureDetector(
                      onTap: () {
                        cubit.clearEmail();
                      },
                      child: const Icon(Icons.clear)),
                  prefixIcon: const Icon(Icons.alternate_email_sharp),
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 10,
                ),
                MainTextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.phoneRequired;
                    } else {
                      return null;
                    }
                  },
                  controller: cubit.phoneController,
                  hintText: AppStrings.phoneHint,
                  suffixIcon: GestureDetector(
                      onTap: () {
                        cubit.clearPhone();
                      },
                      child: const Icon(Icons.clear)),
                  prefixIcon: const Icon(Icons.phone),
                  inputType: TextInputType.phone,
                ),
                const SizedBox(
                  height: 10,
                ),
                MainTextFormField(
                  obscure: cubit.passIsHidden,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.passwordRequired;
                    }else if(value.length<6)
                      {
                        return AppStrings.passwordLength;
                      }
                    else {
                      return null;
                    }
                  },
                  controller: cubit.passwordController,
                  hintText: AppStrings.passwordHint,
                  suffixIcon: GestureDetector(
                      onTap: () {
                        cubit.changePasswordVisibility();
                      },
                      child: Icon(cubit.passSuffix)),
                  prefixIcon: const Icon(Icons.password),
                  inputType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 10,
                ),
                MainTextFormField(
                  obscure: cubit.confirmPassIsHidden,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.confirmPasswordRequired;
                    } else if (cubit.passwordController.text !=
                        cubit.confirmPasswordController.text) {
                      return AppStrings.passwordNotMatch;
                    } else {
                      return null;
                    }
                  },
                  controller: cubit.confirmPasswordController,
                  hintText: AppStrings.confirmPasswordHint,
                  suffixIcon: GestureDetector(
                      onTap: () {
                        cubit.changeConfirmPasswordVisibility();
                      },
                      child: Icon(cubit.confirmPassSuffix)),
                  prefixIcon: const Icon(Icons.password),
                  inputType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 15,
                ),
                if (state is! UserRegisterLoadingState)
                  MainButton(width: 50, height: 40, onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.userRegister(
                          email: cubit.emailController.text,
                          password: cubit.passwordController.text,
                          name: cubit.nameController.text,
                          phone: cubit.phoneController.text);
                    }
                  },
                  child:Text(
                    AppStrings.register,
                    style: Theme.of(context).textTheme.button,
                  )),
                if (state is UserRegisterLoadingState)
                  const LoadingWidget(),
              ],
            ));
      },
    );
  }
}

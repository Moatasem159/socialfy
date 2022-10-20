import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/widgets/loading_widget.dart';
import 'package:socialfy/core/widgets/text_form_field.dart';
import 'package:socialfy/features/login/presentation/cubit/login_cubit.dart';
import 'package:socialfy/features/login/presentation/cubit/login_state.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    var cubit = BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit, LoginStates>(
  listener: (context, state) {
    if(state is LoginSuccessState)
      {
        Fluttertoast.showToast(
          msg: AppStrings.loginSuccessfullyMsg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.black,
          fontSize: 16.0);
         Navigator.pushNamedAndRemoveUntil(context, Routes.mainScreenRoute, (route) => false);
      }
    if(state is LoginErrorState)
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
          const SizedBox(
            height:10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (){},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
                      fixedSize: MaterialStateProperty.all(const Size(50, 50)),
                      shape: MaterialStateProperty.all(const CircleBorder(
                      ))
                  ),
                  child: const Icon(FontAwesomeIcons.facebook,size:30,)),
              ElevatedButton(
                  onPressed: (){},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      fixedSize: MaterialStateProperty.all(const Size(50, 50)),
                      shape: MaterialStateProperty.all(const CircleBorder(
                      ))
                  ),
                  child: const Icon(FontAwesomeIcons.google,size:30,)),
            ],),
          const SizedBox(
            height:10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                MainTextFormField(
                  hintText: AppStrings.emailHint,
                  controller: cubit.emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.emailRequired;
                    } else {
                      return null;
                    }
                  },
                  suffixIcon: GestureDetector(
                      onTap: () {
                        cubit.clearEmail();
                      },
                      child: const Icon(Icons.clear)),
                  prefixIcon: const Icon(Icons.alternate_email_sharp),
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                MainTextFormField(
                  hintText: AppStrings.passwordHint,
                  controller: cubit.passwordController,
                  obscure: cubit.passIsHidden,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.passwordRequired;
                    } else {
                      return null;
                    }
                  },
                  suffixIcon: GestureDetector(
                      onTap: () {
                        cubit.changePasswordVisibility();
                      },
                      child:Icon(cubit.passSuffix)),
                  prefixIcon: const Icon(Icons.password),
                  inputType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.doesNotHaveAccount,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.registerScreenRoute);
                        },
                        child:  Text(AppStrings.signUp,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(AppStrings.forgotPassword,
                        style: Theme.of(context).textTheme.bodyText1,),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                if(state is!LoginLoadingState)
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        cubit.userLogin(email: cubit.emailController.text, password: cubit.passwordController.text,context: context);
                      }
                    },
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(
                            MediaQuery.of(context).size.width - 50, 40))),
                    child:  Text("login",style: Theme.of(context).textTheme.button,)),
                if(state is LoginLoadingState)
                  const LoadingWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  },
);
  }
}

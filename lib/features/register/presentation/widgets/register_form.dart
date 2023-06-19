import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/extensions/screen_size_extension.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/widgets/buttons.dart';
import 'package:socialfy/core/widgets/loading_widget.dart';
import 'package:socialfy/core/widgets/text_form_field.dart';
import 'package:socialfy/features/register/presentation/cubit/custom_validation.dart';
import 'package:socialfy/features/register/presentation/cubit/register_cubit.dart';
import 'package:socialfy/features/register/presentation/cubit/register_state.dart';
class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is UserRegisterSuccessState) {
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
        if (state is UserRegisterErrorState) {
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
        RegisterCubit cubit = RegisterCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              MainTextFormField(
                onChange: (value) =>cubit.typing(value),
                validator: (name) => CustomValidation.validateName(name!),
                controller: cubit.nameController,
                hintText: AppStrings.nameHint,
                suffixIcon: GestureDetector(
                    onTap: () => cubit.clearName(),
                    child: cubit.nameController.text.isEmpty?const SizedBox():const Icon(Icons.clear)),
                prefixIcon: const Icon(Icons.person),
                inputType: TextInputType.name,
              ),
              10.ph,
              MainTextFormField(
                onChange: (value) => cubit.typing(value),
                validator: (email) => CustomValidation.validateEmail(email!),
                controller: cubit.emailController,
                hintText: AppStrings.emailHint,
                suffixIcon: GestureDetector(
                    onTap: () => cubit.clearEmail(),
                    child: cubit.emailController.text.isEmpty?const SizedBox():const Icon(Icons.clear)),
                prefixIcon: const Icon(Icons.alternate_email_sharp),
                inputType: TextInputType.emailAddress,
              ),
              10.ph,
              MainTextFormField(
                onChange: (value) => cubit.typing(value),
                validator: (phoneNumber) =>
                    CustomValidation.validatePhoneNumber(phoneNumber!),
                controller: cubit.phoneController,
                hintText: AppStrings.phoneHint,
                suffixIcon: GestureDetector(
                    onTap: () => cubit.clearPhone(),
                    child: cubit.phoneController.text.isEmpty?const SizedBox():const Icon(Icons.clear)),
                prefixIcon: const Icon(Icons.phone),
                inputType: TextInputType.phone,
              ),
              10.ph,
              MainTextFormField(
                obscure: cubit.passIsHidden,
                validator: (password) =>
                    CustomValidation.validatePassword(password!),
                controller: cubit.passwordController,
                hintText: AppStrings.passwordHint,
                suffixIcon: GestureDetector(
                    onTap: () => cubit.changePasswordVisibility(),
                    child: Icon(cubit.passSuffix)),
                prefixIcon: const Icon(Icons.password),
                inputType: TextInputType.visiblePassword,
              ),
              10.ph,
              MainTextFormField(
                obscure: cubit.confirmPassIsHidden,
                validator: (password) =>
                    CustomValidation.validateConfirmPassword(
                        password!, cubit.confirmPasswordController.text),
                controller: cubit.confirmPasswordController,
                hintText: AppStrings.confirmPasswordHint,
                suffixIcon: GestureDetector(
                    onTap: () => cubit.changeConfirmPasswordVisibility(),
                    child: Icon(cubit.confirmPassSuffix)),
                prefixIcon: const Icon(Icons.password),
                inputType: TextInputType.visiblePassword,
              ),
              15.ph,
              if (state is! UserRegisterLoadingState)
                MainButton(
                  width: context.getWidth(w: 1.8),
                  height: context.getHeight(h: 16),
                  color: Theme.of(context).primaryColor,
                  onPressed: () => cubit.userRegister(),
                  child: Text(AppStrings.register,
                      style: AppTextStyles.getNormalText(
                          fontSize: FontSize.s16,
                          color: Theme.of(context).primaryColorLight)),
                ),
              if (state is UserRegisterLoadingState) const LoadingWidget(),
            ],
          ),
        );
      },
    );
  }
}

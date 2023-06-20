import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/widgets/text_form_field.dart';
import 'package:socialfy/features/register/presentation/cubit/custom_validation.dart';
import 'package:socialfy/features/register/presentation/cubit/register_cubit.dart';
import 'package:socialfy/features/register/presentation/cubit/register_state.dart';
class RegisterFields extends StatelessWidget {
  const RegisterFields({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
      builder: (context, state) {
        RegisterCubit cubit = RegisterCubit.get(context);
        return Column(
          children: [
            MainTextFormField(
                onChange: (value) => cubit.typing(value),
                validator: (name) => CustomValidation.validateName(name!),
                controller: cubit.nameController,
                hintText: AppStrings.nameHint,
                prefixIcon: const Icon(Icons.person),
                inputType: TextInputType.name,
                suffixIcon: GestureDetector(
                    onTap: cubit.clearName,
                    child: cubit.nameController.text.isEmpty
                        ? const SizedBox()
                        : const Icon(Icons.clear))),
            10.ph,
            MainTextFormField(
                onChange: (value) => cubit.typing(value),
                validator: (email) => CustomValidation.validateEmail(email!),
                controller: cubit.emailController,
                hintText: AppStrings.emailHint,
                prefixIcon: const Icon(Icons.alternate_email_sharp),
                inputType: TextInputType.emailAddress,
                suffixIcon: GestureDetector(
                    onTap: cubit.clearEmail,
                    child: cubit.emailController.text.isEmpty
                        ? const SizedBox()
                        : const Icon(Icons.clear))),
            10.ph,
            MainTextFormField(
                onChange: (value) => cubit.typing(value),
                validator: (phoneNumber) =>
                    CustomValidation.validatePhoneNumber(phoneNumber!),
                controller: cubit.phoneController,
                hintText: AppStrings.phoneHint,
                prefixIcon: const Icon(Icons.phone),
                inputType: TextInputType.phone,
                suffixIcon: GestureDetector(
                    onTap: cubit.clearPhone,
                    child: cubit.phoneController.text.isEmpty
                        ? const SizedBox()
                        : const Icon(Icons.clear))),
            10.ph,
            MainTextFormField(
                obscure: cubit.passIsHidden,
                validator: (password) =>
                    CustomValidation.validatePassword(password!),
                controller: cubit.passwordController,
                prefixIcon: const Icon(Icons.password),
                inputType: TextInputType.visiblePassword,
                hintText: AppStrings.passwordHint,
                suffixIcon: GestureDetector(
                    onTap: cubit.changePasswordVisibility,
                    child: Icon(cubit.passSuffix))),
            10.ph,
            MainTextFormField(
                obscure: cubit.confirmPassIsHidden,
                validator: (password) =>
                    CustomValidation.validateConfirmPassword(
                        password!, cubit.confirmPasswordController.text),
                controller: cubit.confirmPasswordController,
                hintText: AppStrings.confirmPasswordHint,
                prefixIcon: const Icon(Icons.password),
                inputType: TextInputType.visiblePassword,
                suffixIcon: GestureDetector(
                    onTap: cubit.changeConfirmPasswordVisibility,
                    child: Icon(cubit.confirmPassSuffix))),
            15.ph,
          ],
        );
      },
    );
  }
}
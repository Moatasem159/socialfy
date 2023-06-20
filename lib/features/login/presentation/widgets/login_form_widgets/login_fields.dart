import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/custom_validation.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/widgets/text_form_field.dart';
import 'package:socialfy/features/login/presentation/cubit/login_cubit.dart';
import 'package:socialfy/features/login/presentation/cubit/login_state.dart';
class LoginFields extends StatelessWidget {
  const LoginFields({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return Column(
          children: [
            10.ph,
            MainTextFormField(
              onChange: (value) => cubit.typing(value),
              hintText: AppStrings.emailHint,
              controller: cubit.emailController,
              validator: (email) =>CustomValidation.validateEmail(email!),
              prefixIcon: const Icon(Icons.alternate_email_sharp),
              inputType: TextInputType.emailAddress,
              suffixIcon: GestureDetector(
              onTap:  cubit.clearEmail,
              child: cubit.emailController.text.isEmpty
                  ? const SizedBox()
                  : const Icon(Icons.clear))),
            15.ph,
            MainTextFormField(
              hintText: AppStrings.passwordHint,
              controller: cubit.passwordController,
              obscure: cubit.passIsHidden,
              validator: (password) =>CustomValidation.validatePassword(password!),
              prefixIcon: const Icon(Icons.password),
              inputType: TextInputType.visiblePassword,
              suffixIcon: GestureDetector(
                  onTap: cubit.changePasswordVisibility,
                  child: Icon(cubit.passSuffix))),
            15.ph,
          ],
        );
      },
    );
  }
}
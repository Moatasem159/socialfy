import 'package:flutter/material.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/values_manager.dart';
import 'package:socialfy/features/login/presentation/widgets/login_form_widgets/forgot_password_button.dart';
import 'package:socialfy/features/login/presentation/widgets/login_form_widgets/login_button.dart';
import 'package:socialfy/features/login/presentation/widgets/login_form_widgets/login_fields.dart';
import 'package:socialfy/features/login/presentation/widgets/login_form_widgets/login_providers.dart';
import 'package:socialfy/features/login/presentation/widgets/login_form_widgets/sign_up_widget.dart';
class LoginFormBody extends StatelessWidget {
  const LoginFormBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p28),
      child: Column(
        children: [
          10.ph,
          const LoginProviders(),
          const LoginFields(),
          const SignUpWidget(),
          10.ph,
          const ForgetPasswordButton(),
          const LoginButton(),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:socialfy/features/login/presentation/widgets/login_form_widgets/login_form.dart';
import 'package:socialfy/features/login/presentation/widgets/login_welcome_widgets/login_welcome_widget.dart';
class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          LoginWelcomeWidget(),
          LoginForm(),
        ],
      ),
    );
  }
}
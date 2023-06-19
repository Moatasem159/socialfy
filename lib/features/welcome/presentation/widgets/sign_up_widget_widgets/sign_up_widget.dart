import 'package:flutter/material.dart';
import 'package:socialfy/features/welcome/presentation/widgets/sign_up_widget_widgets/sign_in_button.dart';
import 'package:socialfy/features/welcome/presentation/widgets/sign_up_widget_widgets/sign_up_buttons.dart';
class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Column(
      children:[
        SignUpButtons(),
        SignInButton(),
      ],
    );
  }
}
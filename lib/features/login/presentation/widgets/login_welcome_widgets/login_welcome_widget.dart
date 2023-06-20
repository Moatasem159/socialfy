import 'package:flutter/material.dart';
import 'package:socialfy/core/widgets/buttons.dart';
import 'package:socialfy/features/login/presentation/widgets/login_welcome_widgets/login_slogan.dart';
import 'package:socialfy/features/login/presentation/widgets/login_welcome_widgets/login_welcome_image.dart';
class LoginWelcomeWidget extends StatelessWidget {
  const LoginWelcomeWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        LoginWelcomeImage(),
        Positioned(top: 15, left: 15,child: MainBackButton()),
        LoginSlogan()
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socialfy/features/login/presentation/widgets/login_form_widgets/circle_button.dart';
class LoginProviders extends StatelessWidget {
  const LoginProviders({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleButton(
            color: Colors.blueAccent,
            icon: FontAwesomeIcons.facebook,onTap: () {}),
        CircleButton(
            color: Colors.red,
            icon: FontAwesomeIcons.google,onTap: () {}),
      ],
    );
  }
}
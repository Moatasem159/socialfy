import 'package:flutter/material.dart';
import 'package:socialfy/features/welcome/presentation/widgets/welcome_screen_body.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body:const WelcomeScreenBody(),
      ),
    );
  }
}
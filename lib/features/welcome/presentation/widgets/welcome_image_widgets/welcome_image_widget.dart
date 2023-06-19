import 'package:flutter/material.dart';
import 'package:socialfy/features/welcome/presentation/widgets/welcome_image_widgets/welcome_image.dart';
import 'package:socialfy/features/welcome/presentation/widgets/welcome_slogan.dart';
class WelcomeImageWidget extends StatelessWidget {
  const WelcomeImageWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        WelcomeImage(),
        WelcomeSlogan()
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/features/welcome/presentation/widgets/sign_up_widget_widgets/sign_up_widget.dart';
import 'package:socialfy/features/welcome/presentation/widgets/welcome_image_widgets/welcome_image_widget.dart';

class WelcomeScreenBody extends StatelessWidget {
  const WelcomeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const WelcomeImageWidget(),
        20.ph,
        const SignUpWidget(),
      ],
    );
  }
}
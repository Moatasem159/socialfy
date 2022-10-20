import 'package:flutter/material.dart';
import 'package:socialfy/features/welcome/presentation/widgets/sign_up_widget.dart';
import 'package:socialfy/features/welcome/presentation/widgets/welcome_image_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            WelcomeImageWidget(),
            SizedBox(
              height: 12,
            ),
            SignUpWidget(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/extensions/screen_size_extension.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/widgets/buttons.dart';
class SignUpButtons extends StatelessWidget {
  const SignUpButtons({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainButton(
            onPressed: () => Navigator.pushNamed(context, Routes.registerScreenRoute),
            width: context.getWidth(w: 1.39),
            color: Theme.of(context).primaryColor,
            height: context.getHeight(h: 15),
            child: Text(
              AppStrings.startWithEmail,
              style: AppTextStyles.getNormalText(
                  fontSize: FontSize.s16,
                  color: Theme.of(context).primaryColorLight),
            )),
        12.ph,
        MainButton(
            onPressed: () {},
            width: context.getWidth(w: 1.39),
            height: context.getHeight(h: 15),
            color: Colors.blueAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(FontAwesomeIcons.facebook,color: Colors.white),
                15.pw,
                const Text(AppStrings.signUpWithFacebook),
              ],
            )),
        12.ph,
        MainButton(
            onPressed: () {},
            width: context.getWidth(w: 1.39),
            height: context.getHeight(h: 15),
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(FontAwesomeIcons.google,color: Colors.white),
                15.pw,
                const Text(AppStrings.signUpWithGoogle),
              ],
            )),
        8.ph,
      ],
    );
  }
}
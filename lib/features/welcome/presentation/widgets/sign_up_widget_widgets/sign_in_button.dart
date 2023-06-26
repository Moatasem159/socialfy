import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
class SignInButton extends StatelessWidget {
  const SignInButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            AppStrings.alreadyHaveAccount,
            style: AppTextStyles.getNormalText(fontSize: FontSize.s16, color: Theme.of(context).primaryColor)
        ),
        5.pw,
        GestureDetector(
          onTap: () => GoRouter.of(context).pushNamed(Routes.loginScreenRoute),
          child: Text(AppStrings.signIn,
            style: AppTextStyles.getNormalText(fontSize: FontSize.s16, color: Theme.of(context).primaryColor).copyWith(
                decoration: TextDecoration.underline
            ),
          ),
        ),
      ],
    );
  }
}
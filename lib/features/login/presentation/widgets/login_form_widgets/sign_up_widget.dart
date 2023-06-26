import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
            AppStrings.doesNotHaveAccount,
            style: AppTextStyles.getNormalText(
                fontSize: FontSize.s14, color: Theme.of(context).primaryColor)
        ),
        5.pw,
        GestureDetector(
          onTap: () => GoRouter.of(context).pushNamed(Routes.registerScreenRoute),
          child: Text(
            AppStrings.signUp,
            style: AppTextStyles.getNormalText(
                fontSize: FontSize.s14, color: Theme.of(context).primaryColor).copyWith(
                decoration: TextDecoration.underline
            ),
          ),
        ),
      ],
    );
  }
}
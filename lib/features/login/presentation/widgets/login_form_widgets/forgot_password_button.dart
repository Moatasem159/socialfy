import 'package:flutter/material.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
              AppStrings.forgotPassword,
              style: AppTextStyles.getNormalText(
                  fontSize: FontSize.s14, color: Theme.of(context).primaryColor)
          ),
        ),
      ),
    );
  }
}
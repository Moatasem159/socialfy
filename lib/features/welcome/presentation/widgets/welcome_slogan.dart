import 'package:flutter/material.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/assets_manager.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/utils/values_manager.dart';
class WelcomeSlogan extends StatelessWidget {
  const WelcomeSlogan({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ImageIcon(
          AssetImage(ImageAssets.appLogo),
          color: Colors.white,
          size: AppSize.s140,
        ),
        Text(
          AppStrings.welcomeSlogan,
          style: AppTextStyles.getBoldText(
            fontSize: FontSize.s20,
            weight: FontWeightManager.semiBold,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
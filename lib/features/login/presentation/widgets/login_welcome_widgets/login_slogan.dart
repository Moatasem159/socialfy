import 'package:flutter/material.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/assets_manager.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/utils/values_manager.dart';
class LoginSlogan extends StatelessWidget {
  const LoginSlogan({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ImageIcon(AssetImage(ImageAssets.appLogo),size: AppSize.s140,color: Colors.white),
        Text(AppStrings.welcome,style: AppTextStyles.getBoldText(fontSize: FontSize.s22, color: Colors.white)),
        5.ph,
        Text(AppStrings.loginToContinue,style: AppTextStyles.getNormalText(fontSize: FontSize.s20, color: Colors.white)),
      ],
    );
  }
}
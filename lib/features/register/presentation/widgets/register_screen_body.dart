import 'package:flutter/material.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/assets_manager.dart';
import 'package:socialfy/core/utils/values_manager.dart';
import 'package:socialfy/features/register/presentation/widgets/register_form.dart';
class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            15.ph,
            ImageIcon(const AssetImage(ImageAssets.appLogo),color: Theme.of(context).primaryColor, size: AppSize.s140),
            const RegisterForm(),
          ],
        ),
      ),
    );
  }
}
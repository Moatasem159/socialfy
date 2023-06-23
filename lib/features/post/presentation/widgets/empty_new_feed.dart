import 'package:flutter/material.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/assets_manager.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';

class EmptyNewFeed extends StatelessWidget {
  const EmptyNewFeed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ImageIcon(const AssetImage(ImageAssets.appLogo),size: 180,color: Theme.of(context).primaryColor,),
          5.ph,
          Text(AppStrings.emptyPosts,style: AppTextStyles.getBoldText(fontSize: FontSize.s22 ,color: Theme.of(context).primaryColor),),
          2.ph,
          Text(AppStrings.beTheFirstToPost,style: AppTextStyles.getBoldText(
              weight: FontWeightManager.medium,
              fontSize: FontSize.s18 ,color: Theme.of(context).primaryColor)),
        ],
      ),
    );
  }
}
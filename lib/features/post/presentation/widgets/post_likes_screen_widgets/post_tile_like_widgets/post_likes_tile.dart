import 'package:flutter/material.dart';
import 'package:socialfy/core/entities/user.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/features/post/presentation/widgets/post_likes_screen_widgets/post_tile_like_widgets/user_tile_image.dart';
class UserLikeTile extends StatelessWidget {
  final User user;
  const UserLikeTile({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          UserTileImage(image: user.profilePic!),
          10.pw,
          Text(
            user.name!,
            style:AppTextStyles.getNormalText(fontSize: FontSize.s16, color:Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}


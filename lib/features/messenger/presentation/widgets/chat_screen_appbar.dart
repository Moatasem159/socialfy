import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:socialfy/core/entities/user.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/assets_manager.dart';
import 'package:socialfy/core/utils/font_manager.dart';

class ChatScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final User user;
  const ChatScreenAppBar({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leadingWidth: 35,
        title: Row(
          children: [
            CachedNetworkImage(
              imageUrl:user.profilePic!,
              height: 35,
              width: 35,
              imageBuilder: (context, imageProvider) {
                return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: imageProvider),
                    )
                );
              },
              placeholder:(context, url) => Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage(ImageAssets.noProfileImagePath))),
              ),
              errorWidget: (context, url, error) => Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage(ImageAssets.noProfileImagePath))),
              ),
            ),
            10.pw,
            Text(user.name!,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.getNormalText(
                    fontSize: FontSize.s16, color: Theme.of(context).primaryColor))
          ],
        ));
  }
  @override
  Size get preferredSize => const Size(double.infinity,60);
}
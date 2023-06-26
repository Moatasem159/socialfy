import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/entities/user.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/assets_manager.dart';
import 'package:socialfy/core/utils/font_manager.dart';
class MessengerUserTile extends StatelessWidget {
  final User user;
  final bool newChat;
  const MessengerUserTile({super.key,required this.user, required this.newChat});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).pushNamed(Routes.chatScreenRoute,extra:user,queryParameters:{"newChat":newChat.toString()}),
      splashColor: Colors.transparent,
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            CachedNetworkImage(
              width: 40,
              height: 40,
              imageUrl: user.profilePic!,
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context)
                              .primaryColor
                              .withOpacity(0.5),
                          width: 1),
                      shape: BoxShape.circle,
                      image: DecorationImage(image: imageProvider)),
                );
              },
              placeholder: (context, url) =>Container(
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
            Text(
              user.name!,
              style: AppTextStyles.getNormalText(
                  fontSize: FontSize.s16,
                  color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
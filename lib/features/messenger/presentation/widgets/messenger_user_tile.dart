import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/core/entities/user.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/widgets/profile_picture_widget.dart';
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
            ProfilePicWidget(image: user.profilePic!,height: 40,width:40),
            10.pw,
            Text(user.name!,style: AppTextStyles.getNormalText(fontSize: FontSize.s16,color: Theme.of(context).primaryColor)),
          ],
        ),
      ),
    );
  }
}
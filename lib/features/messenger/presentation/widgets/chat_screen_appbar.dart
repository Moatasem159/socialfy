import 'package:flutter/material.dart';
import 'package:socialfy/core/entities/user.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/widgets/profile_picture_widget.dart';
class ChatScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final User user;
  const ChatScreenAppBar({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 22,
      title: Row(
        children: [
          ProfilePicWidget(image: user.profilePic!),
          5.pw,
          Text(user.name!,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.getNormalText(
                  fontSize: FontSize.s16,
                  color: Theme.of(context).primaryColor))
        ],
      ),
    );
  }
  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
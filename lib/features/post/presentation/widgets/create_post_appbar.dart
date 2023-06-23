import 'package:flutter/material.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
class CreatePostAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData leading;
  final String title;
  final List<Widget> actions;
  const CreatePostAppBar({super.key, required this.leading, required this.title, required this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(leading)),
      title:  Text(title),
      titleTextStyle:
      AppTextStyles.getNormalText(fontSize: FontSize.s20, color: Theme.of(context).primaryColor),
      actions: actions
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 55);
}
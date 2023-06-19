import 'package:flutter/material.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: AppTextStyles.getNormalText(
              fontSize: FontSize.s20, color: Theme.of(context).primaryColor)),
    );
  }
  @override
  Size get preferredSize => const Size(double.infinity,50);
}
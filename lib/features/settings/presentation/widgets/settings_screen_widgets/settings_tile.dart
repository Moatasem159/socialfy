import 'package:flutter/material.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
class SettingsTile extends StatelessWidget {
  final VoidCallback onTap;
  final IconData iconData;
  final String title;
  const SettingsTile({super.key, required this.onTap, required this.iconData, required this.title});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          children: [
            Icon(iconData,size: 30),
            8.pw,
            Text(title,
                style: AppTextStyles.getNormalText(
                    fontSize: FontSize.s16,
                    color: Theme.of(context).primaryColor)),
          ],
        ),
      ),
    );
  }
}
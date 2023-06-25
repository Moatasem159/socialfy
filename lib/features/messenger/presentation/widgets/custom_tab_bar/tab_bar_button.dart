import 'package:flutter/material.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';

import '../../../../../core/utils/font_manager.dart';

class TabBarButton extends StatelessWidget {
  const TabBarButton({
    super.key,
    required this.onTap,
    required this.backColor,
    required this.title,
    required this.textColor,
  });


  final VoidCallback onTap;
  final Color backColor;
  final String title;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 40,
        width: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(23.5)),
        child: Text(title,
            style: AppTextStyles.getNormalText(
                fontSize: FontSize.s16, color: textColor)),
      ),
    );
  }
}
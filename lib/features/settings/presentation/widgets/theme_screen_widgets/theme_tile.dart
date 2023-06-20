import 'package:flutter/material.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
class ThemeTile extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color bColor;
  const ThemeTile({super.key, required this.onTap, required this.title, required this.bColor});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Row(
          children: [
            Text(title,
                style: AppTextStyles.getNormalText(
                    fontSize: FontSize.s16,
                    color: Theme.of(context).primaryColor)),
            const Spacer(),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: bColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey,width: 1)
              ),
              child: Icon(Icons.done_rounded,color: Theme.of(context).primaryColorLight),
            )
          ],
        ),
      ),
    );
  }
}
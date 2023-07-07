import 'package:flutter/material.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
class MessageText extends StatelessWidget {
  const MessageText({super.key,required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(message,
          maxLines: null,
          style: AppTextStyles.getNormalText(
              fontSize: FontSize.s14, color: Colors.white).copyWith(
            height: 1.1,
            wordSpacing: 1.2,
            letterSpacing: 0.2)),
    );
  }
}
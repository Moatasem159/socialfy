import 'package:flutter/material.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
class ChatField extends StatelessWidget {
  final TextEditingController? controller;
  const ChatField({super.key, this.controller});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        style: AppTextStyles.getNormalText(fontSize: FontSize.s14, color: Theme
            .of(context)
            .colorScheme
            .background),
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: 5,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 14, vertical: 10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)),
            hintText: "Write your message..."),
      ),
    );
  }
}
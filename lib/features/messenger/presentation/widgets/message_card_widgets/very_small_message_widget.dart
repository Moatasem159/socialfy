import 'package:flutter/material.dart';
import 'package:socialfy/core/extensions/screen_size_extension.dart';
import 'package:socialfy/features/messenger/presentation/widgets/message_card_widgets/message_text.dart';
import 'package:socialfy/features/messenger/presentation/widgets/message_card_widgets/time_text.dart';
class VerySmallMessageWidget extends StatelessWidget {
  final bool isSender;
  final String message;
  final String time;
  const VerySmallMessageWidget({super.key, required this.isSender, required this.message,required this.time});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender?Alignment.centerRight:Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(right: isSender?10:0,bottom: 10,left: isSender?0:10),
        padding: const EdgeInsets.only(top: 2),
        decoration:BoxDecoration(
          color: isSender?Colors.grey:const Color(0xff131314),
          borderRadius: BorderRadius.only(
            bottomLeft: const Radius.circular(10),
            bottomRight:const Radius.circular(10),
            topLeft: isSender?const Radius.circular(10):Radius.zero,
            topRight: isSender?Radius.zero:const Radius.circular(10))),
        constraints:BoxConstraints(
          minWidth: 70,
          minHeight: 25,
          maxWidth: context.getWidth(w: 1.22),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 5,left: 10,right: 10),
                  child: MessageText(message: message)
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 2,right: 3),
                child: TimeText(time: time)),
          ],
        ),
      ),
    );
  }
}
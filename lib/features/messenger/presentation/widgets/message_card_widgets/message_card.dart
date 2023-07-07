import 'package:flutter/material.dart';
import 'package:socialfy/core/extensions/screen_size_extension.dart';
import 'package:socialfy/features/messenger/domain/entities/message.dart';
import 'package:socialfy/features/messenger/presentation/widgets/message_card_widgets/message_text.dart';
import 'package:socialfy/features/messenger/presentation/widgets/message_card_widgets/time_text.dart';
class MessageCard extends StatelessWidget {
  final Message message;
  final bool isSender;
  const MessageCard({super.key, required this.isSender, required this.message});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
            right: isSender ? 10 : 0, bottom: 5, left: isSender ? 0 : 10),
        padding: const EdgeInsets.only(left: 8, top: 5, right: 8),
        decoration: BoxDecoration(
            color: isSender ? Colors.grey : const Color(0xff131314),
            borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(10),
                bottomRight: const Radius.circular(10),
                topLeft: isSender ? const Radius.circular(10) : Radius.zero,
                topRight: isSender ? Radius.zero : const Radius.circular(10)),
        ),
        constraints: BoxConstraints(
          minWidth: 70,
          maxWidth: context.getWidth(w: 1.22),
        ),
        child: Wrap(
          verticalDirection: VerticalDirection.down,
          alignment: WrapAlignment.end,
          children: [
            MessageText(message: message.message),
            TimeText(time: message.createdAt),
          ],
        ),
      ),
    );
  }
}
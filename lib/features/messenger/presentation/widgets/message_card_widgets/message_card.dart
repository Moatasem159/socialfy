import 'package:flutter/material.dart';
import 'package:socialfy/features/messenger/presentation/widgets/message_card_widgets/big_message_widget.dart';
import 'package:socialfy/features/messenger/presentation/widgets/message_card_widgets/small_message_widget.dart';
import 'package:socialfy/features/messenger/presentation/widgets/message_card_widgets/very_small_message_widget.dart';
class MessageCard extends StatelessWidget {
  final bool isSender;
  final String message;
  final String time;
  const MessageCard({super.key, required this.isSender, required this.message, required this.time});
  @override
  Widget build(BuildContext context) {
    if(message.length<10)
    {
      return VerySmallMessageWidget(isSender: isSender, message: message, time: time);
    }
    if(message.length<=40) {
      return SmallMessageWidget(isSender: isSender, message: message, time: time);
    }
    if(message.length>40)
    {
      return BigMessageWidget(isSender: isSender, message: message, time: time);
    }
    return const SizedBox();
  }
}
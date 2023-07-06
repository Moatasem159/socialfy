import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/messenger/presentation/cubits/chat_cubit/chat_cubit.dart';
import 'package:socialfy/features/messenger/presentation/widgets/message_card_widgets/message_card.dart';
import 'package:socialfy/features/messenger/presentation/widgets/messages_list_widgets/message_data_widget.dart';
class MessagesListWidget extends StatelessWidget {
  final ScrollController scrollController;
  const MessagesListWidget({super.key, required this.scrollController});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: ChatCubit.get(context).getChatMessages(),
      builder: (context, snapshot) {
        ChatCubit.get(context).fillList(snapshot.hasData?snapshot.data!.docs:[]);
        return ListView.builder(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 40,top: 5),
          controller: scrollController,
          itemCount: ChatCubit.get(context).messages.length,
          itemBuilder: (context, index) {
            final DateTime currentMessage = DateTime.parse(ChatCubit.get(context).messages[index].createdAt);
            final previousMessage = index > 0 ? DateTime.parse(ChatCubit.get(context).messages[index - 1].createdAt) : null;
            final bool isFirstMessageOfDay =
                previousMessage == null
                || currentMessage.day != previousMessage.day ||
                currentMessage.month != previousMessage.month ||
                currentMessage.year != previousMessage.year;
            return Column(
              children: [
                if (isFirstMessageOfDay)
                  MessageDateWidget(date: ChatCubit.get(context).messages[index].createdAt),
                  MessageCard(
                  isSender: ChatCubit.get(context).messages[index].senderId == AppStrings.userLoggedInId,
                  message: ChatCubit.get(context).messages[index].message,
                  time: ChatCubit.get(context).messages[index].createdAt,
                ),
              ],
            );
          },
        );
      }
    );
  }
}
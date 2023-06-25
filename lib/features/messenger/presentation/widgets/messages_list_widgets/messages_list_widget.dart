import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/messenger/presentation/cubits/chat_cubit/chat_cubit.dart';
import 'package:socialfy/features/messenger/presentation/widgets/message_card_widgets/message_card.dart';
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
            return MessageCard(
              isSender: ChatCubit.get(context).messages[index].senderId==AppStrings.userLoggedInId?true:false,
              message: ChatCubit.get(context).messages[index].message,
              time: ChatCubit.get(context).messages[index].createdAt,
            );
          },
        );
      }
    );
  }
}
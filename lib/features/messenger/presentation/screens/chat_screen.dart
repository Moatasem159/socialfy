import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/app/injection_container.dart';
import 'package:socialfy/core/entities/user.dart';
import 'package:socialfy/features/messenger/domain/entities/chat.dart';
import 'package:socialfy/features/messenger/presentation/cubits/chat_cubit/chat_cubit.dart';
import 'package:socialfy/features/messenger/presentation/cubits/send_message_cubit/send_message_cubit.dart';
import 'package:socialfy/features/messenger/presentation/widgets/chat_screen_appbar.dart';
import 'package:socialfy/features/messenger/presentation/widgets/chat_text_field/chat_text_field.dart';
import 'package:socialfy/features/messenger/presentation/widgets/messages_list_widgets/messages_list.dart';
class ChatScreen extends StatelessWidget {
  final User user;
  final bool newChat;
  const ChatScreen({super.key, required this.user, required this.newChat});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<ChatCubit>()..receiverId = user.uId),
          BlocProvider(create: (context) => sl<SendMessageCubit>()..chat = Chat(
                    receiverId: user.uId!, chatId: ChatCubit.get(context).getChatId())..newChat=newChat)
        ],
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              appBar: ChatScreenAppBar(user: user),
              body: const MessagesList(),
              bottomSheet: const ChatTextField(),
            ),
          ),
        ));
  }
}

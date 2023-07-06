import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/features/messenger/presentation/cubits/chat_cubit/chat_cubit.dart';
import 'package:socialfy/features/messenger/presentation/cubits/chat_cubit/chat_state.dart';
import 'package:socialfy/features/messenger/presentation/widgets/chat_text_field/chat_field.dart';
class ChatTextField extends StatelessWidget {
  const ChatTextField({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatCubit, ChatStates>(
  listener: ChatCubit.get(context).listen,
  child: Container(
      padding: const EdgeInsets.only(right: 8,left: 8,bottom:4),
      color: Theme.of(context).colorScheme.background,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ChatField(controller: ChatCubit.get(context).controller),
          5.pw,
          GestureDetector(
            onTap:ChatCubit.get(context).sendMessage,
            child: Container(
              width: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Theme.of(context).primaryColor,shape: BoxShape.circle),
              height: 35,
              child: Icon(
                  FontAwesomeIcons.paperPlane,
                  color: Theme.of(context).colorScheme.background,
                  size: 20),
            ),
          )
        ],
      ),
    ),
);
  }
}
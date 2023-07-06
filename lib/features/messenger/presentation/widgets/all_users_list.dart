import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/messenger/presentation/cubits/get_chats_cubit/get_chats_cubit.dart';
import 'package:socialfy/features/messenger/presentation/cubits/get_chats_cubit/get_chats_state.dart';
import 'package:socialfy/features/messenger/presentation/widgets/messenger_user_tile.dart';
class AllUserList extends StatelessWidget {
  const AllUserList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetChatsCubit, GetChatsStates>(
      builder: (context, state) {
        GetChatsCubit cubit = GetChatsCubit.get(context);
        if (cubit.allChats.isNotEmpty) {
          return SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: cubit.allChats.length,
                  (context, index) =>
                      MessengerUserTile(user: cubit.allChats[index],newChat: true)));
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}

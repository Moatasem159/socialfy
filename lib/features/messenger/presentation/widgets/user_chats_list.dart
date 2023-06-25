import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/widgets/loading_widget.dart';
import 'package:socialfy/features/messenger/presentation/cubits/get_all_user_cubit/get_all_users_cubit.dart';
import 'package:socialfy/features/messenger/presentation/cubits/get_all_user_cubit/get_all_users_state.dart';
import 'package:socialfy/features/messenger/presentation/widgets/messenger_user_tile.dart';
class UserChatsList extends StatelessWidget {
  const UserChatsList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllUsersCubit, GetAllUsersStates>(
      builder: (context, state) {
        GetAllUsersCubit cubit = GetAllUsersCubit.get(context);
        if(state is GetAllUsersLoadingState)
          {
            return const SliverToBoxAdapter(child: Center(child:LoadingWidget(size: 40)));
          }
        if (cubit.userChats.isNotEmpty) {
          return SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: cubit.userChats.length,
                      (context, index) => MessengerUserTile(
                      user: cubit.userChats[index].user!,newChat: false)));
        }
        return const SliverToBoxAdapter(
          child: Center(child: Text("You don't have chats")),
        );
      },
    );
  }
}
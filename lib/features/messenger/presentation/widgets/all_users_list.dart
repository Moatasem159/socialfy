import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/messenger/presentation/cubits/get_all_user_cubit/get_all_users_cubit.dart';
import 'package:socialfy/features/messenger/presentation/cubits/get_all_user_cubit/get_all_users_state.dart';
import 'package:socialfy/features/messenger/presentation/widgets/messenger_user_tile.dart';
class AllUserList extends StatelessWidget {
  const AllUserList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllUsersCubit, GetAllUsersStates>(
      builder: (context, state) {
        GetAllUsersCubit cubit = GetAllUsersCubit.get(context);
        if (cubit.allUser.isNotEmpty) {
          return SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: cubit.allUser.length,
                  (context, index) =>
                      MessengerUserTile(user: cubit.allUser[index],newChat: true,)));
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/messenger/presentation/cubits/tab_bar_cubit/tab_bar_cubit.dart';
import 'package:socialfy/features/messenger/presentation/cubits/tab_bar_cubit/tab_bar_state.dart';
import 'package:socialfy/features/messenger/presentation/widgets/all_users_list.dart';
import 'package:socialfy/features/messenger/presentation/widgets/custom_tab_bar/custom_tab_bar.dart';
import 'package:socialfy/features/messenger/presentation/widgets/user_chats_list.dart';
class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabBarCubit(),
      child: BlocBuilder<TabBarCubit, TabBarStates>(
        builder: (context, state) {
          TabBarCubit cubit = TabBarCubit.get(context);
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const CustomTabBar(),
              if (cubit.index == 0)
                const AllUserList(),
              if (cubit.index == 1)
                const UserChatsList(),
            ],
          );
        },
      ),
    );
  }
}
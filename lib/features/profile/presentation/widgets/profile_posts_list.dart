import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/profile/presentation/cubit/user_posts_cubit/user_posts_cubit.dart';
import 'package:socialfy/features/profile/presentation/cubit/user_posts_cubit/user_posts_state.dart';
import 'package:socialfy/features/profile/presentation/widgets/user_post_card.dart';
class ProfilePostsList extends StatelessWidget {
  const ProfilePostsList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPostsCubit, UserPostsStates>(
      builder: (context, state) {
        return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
            ),
            delegate: SliverChildBuilderDelegate(
                childCount: UserPostsCubit.get(context).userPosts.length,
                (context, index) => UserPostCard(
                    posts: UserPostsCubit.get(context).userPosts[index],
                    index: index)));
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:socialfy/core/widgets/custom_appbar.dart';
import 'package:socialfy/features/post/presentation/widgets/post_widget_widgets/post_widget.dart';
import 'package:socialfy/features/profile/presentation/cubit/user_posts_cubit/user_posts_cubit.dart';
import 'package:socialfy/features/profile/presentation/cubit/user_posts_cubit/user_posts_state.dart';
class PostsScreen extends StatelessWidget {
  final int index;
  const PostsScreen({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ItemScrollController itemController = ItemScrollController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const CustomAppBar(title: "Posts"),
        body: BlocBuilder<UserPostsCubit, UserPostsStates>(
          builder: (context, state) {
            return ScrollablePositionedList.builder(
              itemScrollController: itemController,
              initialScrollIndex: index,
              shrinkWrap: true,
              itemCount: UserPostsCubit.get(context).userPosts.length,
              itemBuilder: (context, index) {
                return PostWidget(post: UserPostsCubit.get(context).userPosts[index]);
              },
            );
          },
        ),
      ),
    );
  }
}

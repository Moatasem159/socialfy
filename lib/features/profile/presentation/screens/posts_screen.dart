import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/features/post/presentation/cubit/post_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/post_state.dart';
import 'package:socialfy/features/post/presentation/widgets/post_widget.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_state.dart';

class PostsScreen extends StatelessWidget {
  final List<Post> posts;
  final int index;

  const PostsScreen({Key? key, required this.posts, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileCubit cubit = BlocProvider.of<ProfileCubit>(context);
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
                backgroundColor: Theme
                    .of(context)
                    .backgroundColor,
                appBar: AppBar(),
                body: ListView.builder(
                  controller: cubit.itemController,
                  shrinkWrap: true,
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return BlocConsumer<PostCubit, PostStates>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return PostWidget(post: posts[index]);
                      },
                    );
                  },
                )));
      },
    );
  }
}

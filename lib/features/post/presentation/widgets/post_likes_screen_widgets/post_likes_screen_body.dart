import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/widgets/loading_widget.dart';
import 'package:socialfy/features/post/presentation/cubit/get_post_likes_cubit/get_post_likes_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/get_post_likes_cubit/get_post_likes_state.dart';
import 'package:socialfy/features/post/presentation/widgets/post_likes_screen_widgets/post_likes_list.dart';
class PostLikesScreenBody extends StatelessWidget {
  const PostLikesScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPostLikesCubit, GetPostLikesStates>(
      builder: (context, state) {
        if(state is GetPostLikesSuccessState) {
          return PostLikesList(users: state.users);
        }
        return const Center(child: LoadingWidget());
      },
    );
  }
}
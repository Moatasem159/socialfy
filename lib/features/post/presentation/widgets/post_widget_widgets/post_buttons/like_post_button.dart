import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/utils/values_manager.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/features/post/presentation/cubit/like_post_cubit/like_post_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/like_post_cubit/like_post_state.dart';
import 'package:socialfy/features/post/presentation/widgets/post_widget_widgets/like_counter.dart';
class LikePostButton extends StatelessWidget {
  const LikePostButton({super.key,required this.post});
  final Post post;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikePostCubit, LikePostStates>(
      builder: (context, state) {
        return Column(
          children: [
            GestureDetector(
                onTap: () {
                  LikePostCubit.get(context).likePost(postId: post.postId, likes: post.likes!, isLiked: post.isLiked);
                  if(post.isLiked)
                    {
                      post.likes!.remove(AppStrings.userLoggedInId);
                    }
                  post.isLiked=!post.isLiked;
                },
                child: post.isLiked
                    ? const Icon(LineAwesomeIcons.heart_1,
                        size: AppSize.s30, color: Colors.red)
                    : const Icon(LineAwesomeIcons.heart, size: AppSize.s30)),
            LikeCounter(likes: post.likes!)
          ],
        );
      },
    );
  }
}
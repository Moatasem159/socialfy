import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/features/post/presentation/cubit/get_posts_cubit/news_feed_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/get_posts_cubit/news_feed_state.dart';
import 'package:socialfy/features/post/presentation/widgets/post_widget_widgets/image_animation.dart';
import 'package:socialfy/features/post/presentation/widgets/post_widget_widgets/post_buttons/post_buttons.dart';
import 'package:socialfy/features/post/presentation/widgets/post_widget_widgets/post_caption.dart';
import 'package:socialfy/features/post/presentation/widgets/post_widget_widgets/post_data_widget.dart';
import 'package:socialfy/features/post/presentation/widgets/post_widget_widgets/post_time.dart';
class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({Key? key, required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPostsCubit, GetPostsStates>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            7.ph,
            PostDataWidget(post: post),
            7.ph,
            ImageLikeAnimations(post: post),
            10.ph,
            PostButtons(post: post),
            // LikeCounter(likes: post.likes!),
            5.ph,
            PostCaption(post: post),
            // CommentsCount(post: post),
            3.ph,
            PostTime(time: post.dateTime!),
            10.ph
          ],
        );
      },
    );
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/app/injection_container.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/extensions/get_time.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/features/post/domain/entities/comment.dart';
import 'package:socialfy/features/post/presentation/cubit/like_comment_cubit/like_comment_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/like_comment_cubit/like_comment_state.dart';
class CommentWidget extends StatelessWidget {
  final Comment comment;
  final String postId;
  const CommentWidget({Key? key, required this.comment, required this.postId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => sl<LikeCommentCubit>(),
  child: BlocBuilder<LikeCommentCubit,LikeCommentStates>(
  builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6, right: 10),
            child: CachedNetworkImage(
              imageUrl: comment.profilePic!,
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: imageProvider)),
                );
              },
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                7.pw,
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${comment.name!}  ",
                        style: AppTextStyles.getBoldText(
                          fontSize: FontSize.s14,
                          color: Theme.of(context).primaryColor,
                          weight: FontWeightManager.semiBold,
                        ),
                      ),
                      TextSpan(
                          text: getTime(comment.dateTime),
                          style: AppTextStyles.getNormalText(
                              fontSize: FontSize.s14,
                              color: Theme.of(context).primaryColor)),
                    ],
                  ),
                ),
                4.ph,
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    comment.comment!,
                    style: AppTextStyles.getNormalText(
                        fontSize: FontSize.s14,
                        color: Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
          ),
          15.pw,
          GestureDetector(
            onTap: () {
              LikeCommentCubit.get(context).likeComment(
                isLike: comment.isLike,
                  postId: postId,
                  commentId: comment.commentId!,
                  likes: comment.likes!);
            },
            child: Column(
              children: [
                comment.likes!.contains(AppStrings.userLoggedInId)
                    ? const Icon(Icons.favorite, color: Colors.red)
                    : const Icon(Icons.favorite_outline),
                2.ph,
                if (comment.likes!.isNotEmpty)
                  Text(
                    "${comment.likes!.length}",
                    style: AppTextStyles.getNormalText(
                        fontSize: FontSize.s12,
                        color: Theme.of(context).primaryColor),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  },
),
);
  }
}

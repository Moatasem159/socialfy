import 'package:flutter/material.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/app_text_styles.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/features/post/presentation/screens/comment_screen.dart';
class CommentsCount extends StatelessWidget {
  final Post post;
  const CommentsCount({super.key, required this.post,});
  @override
  Widget build(BuildContext context) {
    if (post.commentsCount != 0) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CommentsScreen(post: post),
          ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              5.ph,
              Text(post.commentsCount == 1?
              "View ${post.commentsCount} comment":
              "View all ${post.commentsCount} comments",
                  style: AppTextStyles.getNormalText(fontSize: FontSize.s12, color: Colors.grey)),
              3.ph
            ],
          ),
        ),
      );
    }
    return const SizedBox();
  }
}
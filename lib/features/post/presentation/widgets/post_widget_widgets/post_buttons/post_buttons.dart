import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/utils/values_manager.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/features/post/presentation/screens/comment_screen.dart';
import 'package:socialfy/features/post/presentation/widgets/post_widget_widgets/post_buttons/like_post_button.dart';
class PostButtons extends StatelessWidget {
  final Post post;
  const PostButtons({super.key, required this.post});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LikePostButton(post: post),
          17.pw,
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CreateCommentScreen(post: post),
              ));
            },
            child: const Icon(
              LineAwesomeIcons.comment,
              size: AppSize.s30,
            ),
          ),
          7.pw,
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.bookmark_outline, size: AppSize.s30),
          ),
        ],
      ),
    );
  }
}



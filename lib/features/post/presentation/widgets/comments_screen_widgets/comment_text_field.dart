import 'package:flutter/material.dart';
import 'package:socialfy/core/extensions/empty_padding_extension.dart';
import 'package:socialfy/core/extensions/screen_size_extension.dart';
import 'package:socialfy/core/utils/icons_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/widgets/profile_picture_widget.dart';
import 'package:socialfy/core/widgets/text_form_field.dart';
import 'package:socialfy/features/post/presentation/cubit/create_comment_cubit/create_comment_cubit.dart';
class CommentTextField extends StatelessWidget {
  final String postId;
  final int commentCount;
  const CommentTextField({Key? key, required this.postId, required this.commentCount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(),
      height: 60,
      color: Theme.of(context).primaryColorLight,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 5),
        child: Row(
          children: [
            ProfilePicWidget(image: AppStrings.profilePic!),
            5.pw,
            NoneBorderTextFormField(size: 240,
                controller:CreateCommentCubit.get(context)
                  .commentController,hintText:AppStrings.addComment),
            GestureDetector(
              onTap: () {
                CreateCommentCubit.get(context).createComment(
                    postId: postId,
                    commentsCount: commentCount);
                FocusScope.of(context).unfocus();
              },
              child: Center(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 7),
                  child: Icon(MyCustomIcons.paper,size: 25,color:Theme.of(context).appBarTheme
                      .titleTextStyle!.color,)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

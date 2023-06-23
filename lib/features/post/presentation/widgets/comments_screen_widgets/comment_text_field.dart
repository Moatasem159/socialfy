import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:socialfy/core/extensions/screen_size_extension.dart';
import 'package:socialfy/core/utils/icons_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
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
            CachedNetworkImage(
              imageUrl:AppStrings.profilePic!,
              height: 40,
              fadeOutDuration: Duration.zero,
              fadeInDuration: Duration.zero,
              width: 50,
              errorWidget: (context, url, error) => CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey[800],
              ),
              imageBuilder:(context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width:1.5
                      ),
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider
                      )
                  ) ,
                );
              },
              placeholder: (
                      (context, url) {
                    return CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.grey[800],
                    );
                  }
              ),
            ),
            const SizedBox(
              width:5,
            ),
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

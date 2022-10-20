import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/utils/icons_manager.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/widgets/text_form_field.dart';
import 'package:socialfy/features/post/presentation/cubit/post_cubit.dart';

class CommentTextField extends StatelessWidget {
  final String userProfilePic;
  final String postId;
  final int commentCount;
  const CommentTextField({Key? key, required this.userProfilePic, required this.postId, required this.commentCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostCubit cubit = BlocProvider.of<PostCubit>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      color: Colors.grey.withOpacity(.4),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 5),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(userProfilePic),
              backgroundColor: Colors.grey,
              radius: 18,
            ),
            const SizedBox(
              width: 10,
            ),
            NoneBorderTextFormField(size: 120,controller:cubit.commentController,hintText:AppStrings.addComment ),
            GestureDetector(
              onTap: () {
                if (cubit.commentController.text.isNotEmpty) {
                  cubit.createComment(
                      postId: postId,
                      comment: cubit.commentController.text,
                      context: context,
                      commentsCount: commentCount);
                  FocusScope.of(context).unfocus();
                  cubit.commentController.clear();
                }
              },
              child:  Center(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(MyCustomIcons.paper,size: 25,color:Theme.of(context)
                      .appBarTheme
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

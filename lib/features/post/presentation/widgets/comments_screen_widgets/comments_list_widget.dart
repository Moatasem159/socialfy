import 'package:flutter/material.dart';
import 'package:socialfy/features/post/presentation/cubit/get_comments_cubit/get_comments_cubit.dart';
import 'package:socialfy/features/post/presentation/widgets/comments_screen_widgets/comment_widget.dart';
class CommentListWidget extends StatelessWidget {
  final String postId;
  const CommentListWidget({Key? key,required this.postId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: GetCommentsCubit.get(context).comments!.length,
      itemBuilder: (context, index) {
        return CommentWidget(comment:GetCommentsCubit.get(context).comments![index], postId: postId,);
      },);
  }
}
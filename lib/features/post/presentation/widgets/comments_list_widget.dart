import 'package:flutter/material.dart';
import 'package:socialfy/features/post/data/models/comment_model.dart';
import 'package:socialfy/features/post/presentation/widgets/comment_widget.dart';

class CommentListWidget extends StatelessWidget {
  final List<CommentModel> comments;
  final String postId;
  const CommentListWidget({Key? key, required this.comments, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return CommentWidget(comment: comments[index],postId: postId,);
      },);
  }
}

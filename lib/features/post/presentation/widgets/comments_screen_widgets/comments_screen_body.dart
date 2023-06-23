import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialfy/core/widgets/loading_widget.dart';
import 'package:socialfy/features/post/presentation/cubit/get_comments_cubit/get_comments_cubit.dart';
import 'package:socialfy/features/post/presentation/widgets/comments_screen_widgets/comments_list_widget.dart';
import 'package:socialfy/features/post/presentation/widgets/comments_screen_widgets/empty_comment_widget.dart';

class CommentsScreenBody extends StatelessWidget {
  final String postId;
  const CommentsScreenBody({super.key, required this.postId});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: GetCommentsCubit.get(context).getComments(postId),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting)
        {
          return const Center(child: LoadingWidget(size: 40));
        }
        if(snapshot.hasData&&snapshot.data!.docs.isEmpty){
          return const EmptyCommentWidget();
        }
        if (snapshot.hasData&&snapshot.data!.docs.isNotEmpty){
          GetCommentsCubit.get(context).fillList(snapshot);
          return CommentListWidget(postId: postId);
        }
        return const SizedBox();
      },
    );
  }
}
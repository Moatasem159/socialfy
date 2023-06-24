import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialfy/core/widgets/loading_widget.dart';
import 'package:socialfy/features/post/presentation/cubit/get_posts_cubit/news_feed_cubit.dart';
import 'package:socialfy/features/post/presentation/widgets/empty_new_feed.dart';
import 'package:socialfy/features/post/presentation/widgets/post_list_widget.dart';
class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: GetPostsCubit.get(context).getPosts(),
      builder: (context, snapshot){
        if(snapshot.connectionState==ConnectionState.waiting)
        {
          return const Center(child: LoadingWidget());
        }
        if(snapshot.hasData&&snapshot.data!.docs.isEmpty)
        {
          return const EmptyNewFeed();
        }
        if(snapshot.hasData&&snapshot.data!.docs.isNotEmpty) {
          GetPostsCubit.get(context).fillList(snapshot,context);
          return PostListWidget(posts: GetPostsCubit.get(context).posts);
        }
        return const SizedBox();
      },
    );
  }
}
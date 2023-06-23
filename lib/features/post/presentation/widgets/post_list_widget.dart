import 'package:flutter/material.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/features/post/presentation/widgets/post_widget_widgets/post_widget.dart';
class PostListWidget extends StatelessWidget {
  final List<Post> posts;
  const PostListWidget({Key? key, required this.posts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, index) {
      return PostWidget(post: posts[index]);
    },);
  }
}
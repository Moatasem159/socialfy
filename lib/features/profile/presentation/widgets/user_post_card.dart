import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socialfy/config/routes/routes_manager.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
class UserPostCard extends StatelessWidget {
  final Post posts;
  final int index;
  const UserPostCard({super.key, required this.posts, required this.index});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).pushNamed(Routes.userPostScreenRoute,extra: index),
      onLongPress: () {
        // showDialog(context: context, builder:(context) => PostDialog(post: posts[index]));
      },
      child: CachedNetworkImage(
        imageUrl: posts.postImage!,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: Colors.grey,
        ),
      ),
    );
  }
}
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/features/profile/presentation/screens/posts_screen.dart';
class UserPostCard extends StatelessWidget {
  final List<Post> posts;
  final int index;
  const UserPostCard({super.key, required this.posts, required this.index});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        // showDialog(context: context, builder:(context) => PostDialog(post: posts[index]));
      },
      child: CachedNetworkImage(
        imageUrl: posts[index].postImage!,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: Colors.grey,
        ),
      ),
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => PostsScreen(index: index)));
      },
    );
  }
}
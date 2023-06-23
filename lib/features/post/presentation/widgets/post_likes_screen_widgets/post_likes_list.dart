import 'package:flutter/material.dart';
import 'package:socialfy/core/entities/user.dart';
import 'package:socialfy/features/post/presentation/widgets/post_likes_screen_widgets/post_tile_like_widgets/post_likes_tile.dart';
class PostLikesList extends StatelessWidget {
  final List<User> users;
  const PostLikesList({super.key, required this.users});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: users.length,
        itemBuilder: (context, index) =>UserLikeTile(user:users[index]));
  }
}
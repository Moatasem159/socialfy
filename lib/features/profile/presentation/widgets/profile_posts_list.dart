import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/features/profile/presentation/screens/posts_screen.dart';
import 'package:socialfy/features/profile/presentation/widgets/post_dialog.dart';

class ProfilePostsList extends StatelessWidget {
  final List<Post> posts;

  const ProfilePostsList({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
          childCount: posts.length,
              (context, index) {
            return GestureDetector(
              onLongPress: () {
                showDialog(context: context, builder:(context) => PostDialog(post: posts[index]),);
              },
              child: CachedNetworkImage(
                imageUrl:posts[index].postImage!,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PostsScreen(posts: posts, index: index),
                    ));
                // BlocProvider.of<ProfileCubit>(context).scrollToPost(index: index.toDouble());
              },
            );
          }),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
      ),
    );
  }
}

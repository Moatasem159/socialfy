import 'package:flutter/material.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/features/profile/presentation/screens/posts_screen.dart';

class ProfilePostsList extends StatelessWidget {
  final List<Post> posts;

  const ProfilePostsList({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(slivers: [
      SliverOverlapInjector(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      ),
      SliverGrid(
        delegate: SliverChildBuilderDelegate(childCount: posts.length,
            (context, index) {
          return GestureDetector(
            child: Image(
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (frame == null) {
                  return Container(
                    color: Colors.grey,
                  );
                } else {
                  return child;
                }
              },
              image: NetworkImage(posts[index].postImage!),
              fit: BoxFit.cover,
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
            crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2),
      ),
    ]);
  }
}

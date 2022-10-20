import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/core/utils/icons_manager.dart';
import 'package:socialfy/core/utils/values_manager.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/features/post/presentation/cubit/post_cubit.dart';
import 'package:socialfy/features/post/presentation/screens/comment_screen.dart';
import 'package:socialfy/features/post/presentation/screens/people_who_liked_screen.dart';
import 'package:socialfy/features/post/presentation/widgets/image_animation.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        //profile image
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width - 350),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(post.profilePic!),
                backgroundColor: Colors.grey,
                radius: 17,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                post.username!,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeightManager.semiBold),
              ),
              const Spacer(),
              GestureDetector(
                  onTap: () {}, child: const Icon(Icons.more_vert_outlined))
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
            width: double.maxFinite,
            child: ImageLikeAnimations(
              postImage: post.postImage!,
              postId: post.postId!,
              model: post,
            )),
        const SizedBox(
          height: 10,
        ),
        //buttons
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width - 350),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    BlocProvider.of<PostCubit>(context).like(
                        postId: post.postId!,
                        uid: BlocProvider.of<ProfileCubit>(context)
                            .profile!
                            .uId!,
                        name: BlocProvider.of<ProfileCubit>(context)
                            .profile!
                            .name!,
                        profilePic: BlocProvider.of<ProfileCubit>(context)
                            .profile!
                            .profilePic!);
                  },
                  child: post.isLike
                      ? const Icon(Icons.favorite,
                          size: AppSize.s35, color: Colors.red)
                      : const Icon(Icons.favorite_outline, size: AppSize.s35)),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CreateCommentScreen(post: post),
                  ));
                },
                child: const Icon(
                  MyCustomIcons.commentAlt2,
                  size: AppSize.s31,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              // const Icon(
              //   Icons.send_outlined,
              //   size: AppSize.s33,
              // ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  // BlocProvider.of<PostCubit>(context).deletePost(postId: post.postId!, postImage:post.postImage!);
                },
                child: const Icon(
                  Icons.bookmark_outline,
                  size: AppSize.s35,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        //likes
        if (post.likes!.isNotEmpty)
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PeopleWhoLikedScreen(likes: post.likes!),
              ));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width - 350),
              child: Text(
                "${post.likes!.length} likes",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: AppSize.s14),
              ),
            ),
          ),
        //caption
        const SizedBox(
          height: 1,
        ),
        if (post.postText != '')
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width - 350),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    post.username!,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeightManager.medium,
                        fontSize: AppSize.s14),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    child: Text(
                      post.postText!,
                      maxLines: null,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontSize: AppSize.s14),
                    ),
                  ),
                )
              ],
            ),
          ),
        //comments
        const SizedBox(
          height: 5,
        ),
        if (post.commentsCount != 0)
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CreateCommentScreen(post: post),
              ));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width - 350),
              child: post.commentsCount == 1
                  ? Text(
                      "View ${post.commentsCount} comment",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: AppSize.s12, color: Colors.grey[700]),
                    )
                  : Text(
                      "View all ${post.commentsCount} comments",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: AppSize.s12, color: Colors.grey[700]),
                    ),
            ),
          ),
        //time
        const SizedBox(
          height: 3,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width - 345),
          child: Text(
            post.time!,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontSize: AppSize.s10, color: Colors.grey[700]),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}

import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:socialfy/core/utils/values_manager.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/features/post/presentation/cubit/post_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/post_state.dart';
import 'package:socialfy/features/post/presentation/screens/comment_screen.dart';
class PostDialog extends StatelessWidget {
  final Post post;
  const PostDialog({Key? key,required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostStates>(
  builder: (context, state) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4,sigmaY:4),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        backgroundColor:Theme.of(context).primaryColorLight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10),
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl:post.profilePic!,
                    height: 35,
                    width: 35,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: imageProvider),
                          )
                      );
                    },
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    post.username!,
                    // style: Theme.of(context)
                    //     .textTheme
                    //     .bodyText1!
                    //     .copyWith(fontWeight: FontWeightManager.medium),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.more_vert_sharp,size:AppSize.s20,),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CachedNetworkImage(
              imageUrl: post.postImage!,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal:10),
              child: Row(
                children: [
                  // GestureDetector(
                  //     onTap: () {
                  //       // BlocProvider.of<PostCubit>(context).like(
                  //       //     postId: post.postId!,
                  //       //     uid: BlocProvider.of<ProfileCubit>(context)
                  //       //         .profile!
                  //       //         .uId!,
                  //       //     name: BlocProvider.of<ProfileCubit>(context)
                  //       //         .profile!
                  //       //         .name!,
                  //       //     profilePic: BlocProvider.of<ProfileCubit>(context)
                  //       //         .profile!
                  //       //         .profilePic!);
                  //     },
                  //     child: post.isLike
                  //         ? const Icon(LineAwesomeIcons.heart_1,
                  //         size: AppSize.s30, color: Colors.red)
                  //         : const Icon(LineAwesomeIcons.heart, size: AppSize.s30)),
                  const SizedBox(
                    width: 17,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CreateCommentScreen(post: post),
                      ));
                    },
                    child: const Icon(
                      LineAwesomeIcons.comment,
                      size: AppSize.s30,
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                    },
                    child: const Icon(
                      Icons.bookmark_outline,
                      size: AppSize.s30,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  },
);
  }
}
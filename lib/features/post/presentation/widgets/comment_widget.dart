import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/utils/font_manager.dart';
import 'package:socialfy/features/post/domain/entities/comment.dart';
import 'package:socialfy/features/post/presentation/cubit/post_cubit.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit.dart';

class CommentWidget extends StatelessWidget {

 final Comment comment;
 final String postId;
  const CommentWidget({Key? key, required this.comment, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: CircleAvatar(
              backgroundImage: NetworkImage(comment.profilePic!),
              backgroundColor: Colors.grey,
              radius: 18,
            ),
          ),
          Expanded(
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const SizedBox(width: 7,),
                Expanded(
                  flex: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(text:TextSpan(
                        children: [
                          TextSpan(
                          text: "${comment.name!}  ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontWeight: FontWeightManager.semiBold,
                                fontSize: 13
                            ),
                          ),
                          TextSpan(
                          text: comment.comment!,
                            style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 13),
                        ),
                        ]
                      )),
                      const SizedBox(height: 4,),
                      Row(
                        children: [
                          Text(comment.time!,style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 9
                          ),),
                          const SizedBox(width: 9,),
                          if(comment.likes!.isNotEmpty)
                          comment.likes!.length==1?
                          Text("${comment.likes!.length} like",
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 9
                          ),):
                          Text("${comment.likes!.length} likes",
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 9
                          ),),
                        ],
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),
          GestureDetector(
            onTap: () {
                BlocProvider.of<PostCubit>(context).likeComment(
                  commentId: comment.commentID!,
                  postId: postId,
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
              child:comment.isLike
                  ? const Icon(Icons.favorite,color: Colors.red)
                  : const Icon(Icons.favorite_outline)),
        ],
      ),
    );
  }
}

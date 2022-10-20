import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialfy/core/utils/strings_manager.dart';
import 'package:socialfy/core/widgets/loading_widget.dart';
import 'package:socialfy/features/post/domain/entities/post.dart';
import 'package:socialfy/features/post/presentation/cubit/post_cubit.dart';
import 'package:socialfy/features/post/presentation/cubit/post_state.dart';
import 'package:socialfy/features/post/presentation/widgets/comment_text_field.dart';
import 'package:socialfy/features/post/presentation/widgets/comments_list_widget.dart';
import 'package:socialfy/features/post/presentation/widgets/empty_comment_widget.dart';
import 'package:socialfy/features/profile/data/models/user_model.dart';
import 'package:socialfy/features/profile/presentation/cubit/profile_cubit.dart';

class CreateCommentScreen extends StatelessWidget {
  final Post post;

  const CreateCommentScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostCubit cubit = BlocProvider.of<PostCubit>(context);
    UserDataModel? user = BlocProvider.of<ProfileCubit>(context).profile;
    return WillPopScope(
      onWillPop: () async {
        cubit.comments = null;
        Navigator.pop(context);
        return true;
      },
      child: Builder(builder: (context) {
        cubit.getPostComments(postId: post.postId!);
        return BlocConsumer<PostCubit, PostStates>(
          listener: (context, state) {
            if(state is CreateCommentSuccessState)
              {
                cubit.getPostComments(postId: post.postId!);
              }
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SafeArea(
                  child: Scaffold(
                      appBar: AppBar(
                        title: Text(
                          AppStrings.comments,
                          style: Theme.of(context)
                              .appBarTheme
                              .titleTextStyle!
                              .copyWith(fontSize: 20),
                        ),
                        leading: GestureDetector(
                          onTap: () {
                            cubit.comments = null;
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_outlined),
                        ),
                      ),
                      body: SingleChildScrollView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        child: Column(
                          children: [
                            if (cubit.comments != null &&
                                cubit.comments!.isNotEmpty)
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height - 150,
                                  child: RefreshIndicator(
                                      onRefresh: () async {
                                        cubit.getPostComments(
                                            postId: post.postId!);
                                      },
                                      child: CommentListWidget(
                                        postId: post.postId!,
                                          comments: cubit.comments!))),
                            if (state is GetPostCommentsLoadingState &&
                                cubit.comments == null)
                              const LoadingWidget(),
                            if (state is GetPostCommentsSuccessState &&
                                (cubit.comments == null ||
                                    cubit.comments!.isEmpty))
                              const EmptyCommentWidget()
                          ],
                        ),
                      ),
                      bottomSheet: CommentTextField(
                        commentCount: post.commentsCount!,
                        postId: post.postId!,
                        userProfilePic: user!.profilePic!,
                      ))),
            );
          },
        );
      }),
    );
  }
}
